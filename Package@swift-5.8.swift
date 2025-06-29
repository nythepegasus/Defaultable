// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "Defaultable",
    products: [
        .library(name: "Defaultable", targets: ["Defaultable"]),
        .library(name: "DefaultableFoundation", targets: ["DefaultableFoundation"])
    ],
    targets: [
        .target(name: "Defaultable"),
        .target(name: "DefaultableFoundation", dependencies: ["Defaultable"]),
        .testTarget(name: "DefaultableTests", dependencies: ["Defaultable", "DefaultableFoundation"]),
    ]
)
