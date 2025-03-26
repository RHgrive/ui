// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "ui",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ui",
            type: .dynamic,
            targets: ["SwiftModule"]  // メインターゲットをSwiftに
        ),
    ],
    targets: [
        // Objective-Cターゲット
        .target(
            name: "ObjCModule",
            path: "Sources/ObjC",
            publicHeadersPath: ".",
            cSettings: [.headerSearchPath(".")]
        ),
        
        // Swiftターゲット（ObjCに依存）
        .target(
            name: "SwiftModule",
            dependencies: ["ObjCModule"],
            path: "Sources/Swift"
        )
    ]
)
