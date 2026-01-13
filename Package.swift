// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "WhopCheckout",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "WhopCheckout",
            targets: ["CheckoutBootstrap"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apollographql/apollo-ios.git", exact: "2.0.3"),
    ],
    targets: [
        .target(
            name: "CheckoutBootstrap",
            dependencies: [
                "CheckoutFramework",
                .product(name: "Apollo", package: "apollo-ios"),
            ],
            path: "Sources"
        ),
        .binaryTarget(
            name: "CheckoutFramework",
            url: "https://github.com/whopio/whopsdk-checkout-swift/releases/download/0.1.0/WhopCheckout.xcframework.zip",
            checksum: "79e2f84e0f7d6e388262e78924697ff3fdd08cfc8b9e629ab8a436d667afb05b"
        ),
    ]
)
