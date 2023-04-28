// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "FoundationExtensions",
    platforms: [
        .iOS(.v15),
        .macCatalyst(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8),
    ],
    products: [
        .library(
            name: "FoundationExtensions",
            targets: ["FoundationExtensions"]),
    ],
    targets: [
        .target(
            name: "FoundationExtensions",
            dependencies: []),
        .testTarget(
            name: "FoundationExtensionsTests",
            dependencies: ["FoundationExtensions"]),
    ]
)
