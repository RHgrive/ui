import PackageDescription

let package = Package(
    name: "SwiftObjcIntegration",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "SwiftObjcIntegration", type: .dynamic, targets: ["SwiftObjcIntegration"]),
    ],
    targets: [
        .target(
            name: "SwiftObjcIntegration",
            dependencies: [],
            cSettings: [
                .headerSearchPath("Sources/ObjC")
            ]
        ),
        .testTarget(
            name: "SwiftObjcIntegrationTests",
            dependencies: ["SwiftObjcIntegration"]
        ),
    ]
)
