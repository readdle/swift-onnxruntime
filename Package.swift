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
   url: "https://github.com/readdle/swift-onnxruntime/releases/download/1.18.0/onnxruntime-1.18.0-xcframework.zip",
   checksum: "bf71242d3fb4810f9bd08166ce124b03dae97c8393a7b6b897fb6277a84a1093"
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
