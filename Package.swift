// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription


let package = Package(
    name: "SwiftUIBottomSheet",
    platforms: [
        .iOS(.v16),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "SwiftUIBottomSheet",
            targets: ["SwiftUIBottomSheet"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftUIBottomSheet",
            dependencies: []),
        .testTarget(
            name: "SwiftUIBottomSheetTests",
            dependencies: ["SwiftUIBottomSheet"]),
    ]
)
