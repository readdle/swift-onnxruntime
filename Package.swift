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
   url: "https://github.com/readdle/swift-onnxruntime/releases/download/1.20.0/onnxruntime-1.20.0-xcframework.zip",
   checksum: "ea82d0213b45b8d750c96d43082835057508eefdcc85e0afab71a20daf4868be"
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
