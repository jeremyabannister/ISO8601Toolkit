// swift-tools-version: 5.8

///
import PackageDescription

///
let package = Package(
    name: "ISO8601Toolkit",
    products: [
        .library(
            name: "ISO8601Toolkit",
            targets: ["ISO8601Toolkit"]
        ),
    ],
    dependencies: [
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ErrorMessage-module",
            from: "0.1.0"
        ),
    ],
    targets: [
        .target(
            name: "ISO8601Toolkit",
            dependencies: [
                "ErrorMessage-module",
            ]
        ),
        .testTarget(
            name: "ISO8601Toolkit-tests",
            dependencies: [
                "ISO8601Toolkit",
            ]
        ),
    ]
)
