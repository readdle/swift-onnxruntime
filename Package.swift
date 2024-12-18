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
   url: "https://github.com/readdle/swift-onnxruntime/releases/download/1.19.0/onnxruntime-1.19.0-xcframework.zip",
   checksum: "bec31b51f7fa57742d350753e165c415e062930826e1e2ee60a225bca9176e29"
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
