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
            url: "https://github.com/whopio/whopsdk-checkout-swift/releases/download/0.3.0/WhopCheckout.xcframework.zip",
            checksum: "cecf467151c976b1a969cfef134811563193826f994a36fcec9e3f7911b38f3a"
        ),
    ],
    swiftLanguageModes: [.v5]
)
