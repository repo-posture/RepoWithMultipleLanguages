// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SBOMTestSwift",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SBOMTestSwift",
            targets: ["SBOMTestSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.76.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.7.1"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.5.2"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.51.0"),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess", from: "4.2.2"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.54.0"),
    ],
    targets: [
        .target(
            name: "SBOMTestSwift",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "Logging", package: "swift-log"),
                .product(name: "NIO", package: "swift-nio"),
                .product(name: "KeychainAccess", package: "KeychainAccess"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]),
        .testTarget(
            name: "SBOMTestSwiftTests",
            dependencies: ["SBOMTestSwift"]),
    ]
)
