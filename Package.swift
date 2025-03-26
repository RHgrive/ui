// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "ui",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ui",
            targets: ["ui"]
        ),
    ],
    targets: [
        .target(
            name: "ObjCModule",
            path: "Sources/ObjC",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        ),
        .target(
            name: "SwiftModule",
            dependencies: ["ObjCModule"],
            path: "Sources/Swift"
        ),
        .target(
            name: "ui",
            dependencies: ["ObjCModule", "SwiftModule"]
        )
    ]
)
