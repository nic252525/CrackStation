// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CrackStation",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CrackStation",
            targets: ["CrackStation"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        // swift-crypto 1.x and 2.x are almost API compatible, so most clients should allow either
        .package(url: "https://github.com/apple/swift-crypto.git", "1.0.0" ..< "3.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CrackStation",
            dependencies: [
                .product(name: "Crypto", package: "swift-crypto"),
            ],
            resources: [
                .process("data.json"),
            ]),
        .testTarget(
            name: "CrackStationTests",
            dependencies: ["CrackStation"]),
    ]
)
