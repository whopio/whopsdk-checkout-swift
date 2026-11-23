// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "WhopCheckout",
    platforms: [
        .iOS(.v18),
    ],
    products: [
        .library(
            name: "WhopCheckout",
            targets: ["CheckoutBootstrap"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apollographql/apollo-ios.git", exact: "2.2.0"),
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
            url: "https://github.com/whopio/whopsdk-checkout-swift/releases/download/0.4.1/WhopCheckout.xcframework.zip",
            checksum: "f99a47c534641db5ea4c4af3c9ace1bfe4e2e0e81beda6d8cec72e1d075876fb"
        ),
    ],
    swiftLanguageModes: [.v5]
)
