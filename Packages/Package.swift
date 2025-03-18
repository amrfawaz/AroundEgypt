// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Packages",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"]),
        .library(
            name: "EnvironmentVariables",
            targets: ["EnvironmentVariables"]),
        .library(
            name: "CoreInterface",
            targets: ["CoreInterface"]),
        .library(
            name: "RealmManager",
            targets: ["RealmManager"]),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-cocoa", from: "10.5.0")
    ],
    targets: [
        .target(
            name: "Networking",
            dependencies: []
        ),
        .target(
            name: "EnvironmentVariables",
            dependencies: []
        ),
        .target(
            name: "CoreInterface",
            dependencies: []
        ),
        .target(
            name: "RealmManager",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-cocoa")
            ]
        ),
    ]
)
