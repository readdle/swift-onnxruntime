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
   url: "https://github.com/readdle/swift-onnxruntime/releases/download/1.20.1/onnxruntime-1.20.1-xcframework.zip",
   checksum: "31017531ebb064f1903a73ca5d55597ac49b6ae32360eb2482fb2f435342fdad"
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
