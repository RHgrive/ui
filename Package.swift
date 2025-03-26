// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "SwiftObjcIntegration",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "SwiftObjcIntegration", type: .dynamic, targets: ["SwiftObjcIntegrationSwift"]),
    ],
    targets: [
        .target(
            name: "SwiftObjcIntegrationSwift",
            dependencies: [],
            path: "Sources/Swift",
            cSettings: [
                .headerSearchPath("Sources/ObjC")
            ]
        ),
        .target(
            name: "SwiftObjcIntegrationObjC",
            dependencies: [],
            path: "Sources/ObjC"
        )
    ]
)
