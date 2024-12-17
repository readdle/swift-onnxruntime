# swift-onnxruntime
A basic Swift Package wrapper for `ONNX Runtime` releases from [microsoft/onnxruntime](https://github.com/microsoft/onnxruntime).

# Usage
Add a dependency to your Swift Package definition.
The example below is in `swift-tools-version: 5.4` syntax:
```swift
let package = Package(
  name: "MyPackage",
  products: [.library(name: "MyLib", targets: ["MyLib"])],
  dependencies: [
      .package(url: "https://github.com/readdle/swift-onnxruntime.git", .upToNextMinor(from: "1.17.3")),
  ],
  targets: [
      .target(
          name: "MyLib",
          dependencies: [
              .product(name: "CONNXRuntime", package: "swift-onnxruntime"),
          ],
…
```

Import `CONNXRuntime` module in your Swift code and use [ORT C API](https://onnxruntime.ai/docs/api/c/struct_ort_api.html):
```swift
import CONNXRuntime

let api = OrtGetApiBase()!.pointee.GetApi(UInt32(ORT_API_VERSION))!
var env: OpaquePointer?
if let status = api.pointee.CreateEnv(ORT_LOGGING_LEVEL_INFO, "ONNXRuntimeTest", &env) {
    let errorCode = api.pointee.GetErrorCode(status)
    let errorMessage = String(cString: api.pointee.GetErrorMessage(status)!)
    print("Failed to create ORT environment: \(errorMessage), \(errorCode)")
    api.pointee.ReleaseStatus(status)
    return
}
api.pointee.ReleaseEnv(env)
```

Or include `CONNXRuntime.h` header (or `onnxruntime_c_api.h` directly) in your C code:
```c
#include <CONNXRuntime.h>
#include <stdio.h>

int main() {
    const OrtApi *api = OrtGetApiBase()->GetApi(ORT_API_VERSION);
    OrtEnv *env;
    OrtStatus *status = api->CreateEnv(ORT_LOGGING_LEVEL_WARNING, "test", &env);
    if (status != NULL) {
        printf("Failed to create ONNX Runtime environment\n");
        api->ReleaseStatus(status);
        return -1;
    }
    api->ReleaseEnv(env);
}
```

# Versioning
As it is only a wrapper, versioning strictly follows the original.
Version `1.17.3` would correspond to official [v1.17.3](https://github.com/microsoft/onnxruntime/releases/tag/v1.17.3) release
and so on.

# Licenses
This project is under MIT license. ONNX Runtime binaries are
from [microsoft/onnxruntime repository](https://github.com/microsoft/onnxruntime) and also are licensed under
the [MIT license](https://github.com/microsoft/onnxruntime?tab=MIT-1-ov-file#).
