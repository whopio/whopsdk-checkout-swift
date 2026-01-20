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
        .package(url: "https://github.com/apollographql/apollo-ios.git", exact: "2.0.5"),
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
            url: "https://github.com/whopio/whopsdk-checkout-swift/releases/download/0.2.0/WhopCheckout.xcframework.zip",
            checksum: "645469899d8bd960f592629d0877f4e3bb2bdb9c9605fad10cdcded61ddcb11e"
        ),
    ]
)
