// swift-tools-version:5.3
// This file is generated. Do not edit.

import PackageDescription

let onnxRuntimeBinaryTarget: Target
#if ONNX_RUNTIME_USE_LOCAL_FRAMEWORK
onnxRuntimeBinaryTarget = .binaryTarget(
    name: "ONNXRuntimeBinary",
    path: "onnxruntime.xcframework"
)
#else
onnxRuntimeBinaryTarget = .binaryTarget(
   name: "ONNXRuntimeBinary",
   url: "https://github.com/readdle/swift-onnxruntime/releases/download/1.19.2/onnxruntime-1.19.2-xcframework.zip",
   checksum: "c19070eea196948ddf2750ed68cdd73efe8fad3ced1fa84a24ce738c5150e173"
)
#endif

let package = Package(
    name: "ONNXRuntime",
    platforms: [
        .macOS(.v11),
    ],
    products: [
        .library(name: "CONNXRuntime", targets: ["CONNXRuntime"]),
    ],
    targets: [
        onnxRuntimeBinaryTarget,
        .target(
            name: "CONNXRuntime",
            dependencies: [
                "ONNXRuntimeBinary",
            ]
        ),
        .testTarget(
            name: "CONNXRuntimeTests",
            dependencies: [
                "CONNXRuntime",
            ]
        ),
    ]
)
