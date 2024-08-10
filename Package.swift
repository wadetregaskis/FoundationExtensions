// swift-tools-version: 5.10

import PackageDescription

let enables = ["AccessLevelOnImport",
               "BareSlashRegexLiterals",
               "ConciseMagicFile",
               "DeprecateApplicationMain",
               "DisableOutwardActorInference",
               "DynamicActorIsolation",
               "ExistentialAny",
               "ForwardTrailingClosures",
               //"FullTypedThrows", // Not ready yet, in Swift 6.  https://forums.swift.org/t/where-is-fulltypedthrows/72346/15
               "GlobalConcurrency",
               "ImplicitOpenExistentials",
               "ImportObjcForwardDeclarations",
               "InferSendableFromCaptures",
               "InternalImportsByDefault",
               "IsolatedDefaultValues",
               "StrictConcurrency"]

let settings: [SwiftSetting] = enables.flatMap {
    [.enableUpcomingFeature($0), .enableExperimentalFeature($0)]
}

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
            dependencies: [],
            swiftSettings: settings),
        .testTarget(
            name: "FoundationExtensionsTests",
            dependencies: ["FoundationExtensions"],
            swiftSettings: settings),
    ]
)
