// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "WeatherStorage",
    products: [
        .library(
            name: "WeatherStorage",
            targets: ["WeatherStorage"]
        ),
    ],
    dependencies: [
        .package(name: "Realm", url: "https://github.com/realm/realm-cocoa.git", "10.13.0"..<"11.0.0"),
    ],
    targets: [
        .target(
            name: "WeatherStorage",
            dependencies: [
                .product(name: "Realm", package: "Realm"),
                .product(name: "RealmSwift", package: "Realm")
            ]
        ),
        .testTarget(
            name: "WeatherStorageTests",
            dependencies: ["WeatherStorage"]
        ),
    ]
)
