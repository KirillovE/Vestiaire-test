// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "WeatherLoader",
    products: [
        .library(
            name: "WeatherLoader",
            targets: ["WeatherLoader"]
        ),
    ],
    targets: [
        .target(
            name: "WeatherLoader",
            dependencies: []
        ),
        .testTarget(
            name: "WeatherLoaderTests",
            dependencies: ["WeatherLoader"]
        )
    ]
)
