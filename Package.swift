// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "Defaultable",
    products: [
        .library(name: "Defaultable", targets: ["Defaultable"]),
        .library(name: "DefaultableFoundation", targets: ["DefaultableFoundation"])
    ],
    traits: [
        "DFNumerics",
        "DFURL",
        .default(enabledTraits: ["DFNumerics"]),
    ],
    targets: [
        .target(name: "Defaultable"),
        .target(name: "DefaultableFoundation", dependencies: ["Defaultable"]),
        .testTarget(name: "DefaultableTests", dependencies: ["Defaultable", "DefaultableFoundation"]),
    ]
)

// to RD: I hope you never use my garbage software <3
