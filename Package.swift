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
        .package(url: "https://github.com/apollographql/apollo-ios.git", exact: "2.1.1"),
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
            url: "https://github.com/whopio/whopsdk-checkout-swift/releases/download/0.4.0/WhopCheckout.xcframework.zip",
            checksum: "a7a25a15d4a498fee232f20409e37f8e3a6ece8db5fe7c6c325116a6fd083574"
        ),
    ],
    swiftLanguageModes: [.v5]
)
