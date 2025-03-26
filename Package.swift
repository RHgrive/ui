// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "ui",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ui",
            type: .dynamic,
            targets: ["ui"]
        ),
    ],
    targets: [
        // Objective-Cターゲット
        .target(
            name: "ObjCModule",
            path: "Sources/ObjC",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        ),
        
        // Swiftターゲット
        .target(
            name: "SwiftModule",
            dependencies: ["ObjCModule"],
            path: "Sources/Swift"
        ),
        
        // 統合ターゲット
        .target(
            name: "ui",
            dependencies: ["ObjCModule", "SwiftModule"],
            path: "Sources/Integration",
            sources: []
        )
    ]
)
