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
        .library(
            name: "Experiences",
            targets: ["Experiences"]),
        .library(
            name: "ExperienceDetails",
            targets: ["ExperienceDetails"]),
        .library(
            name: "SharedModels",
            targets: ["SharedModels"]),
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
            name: "Experiences",
            dependencies: [
                "EnvironmentVariables",
                "CoreInterface",
                "Networking",
                "RealmManager",
                "ExperienceDetails",
                "SharedModels"
            ]
        ),
        .target(
            name: "ExperienceDetails",
            dependencies: [
                "EnvironmentVariables",
                "CoreInterface",
                "Networking",
                "RealmManager",
                "SharedModels"
            ]
        ),
        .target(
            name: "SharedModels",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-cocoa"),
            ]
        ),
        .target(
            name: "RealmManager",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-cocoa")
            ]
        ),
    ]
)
