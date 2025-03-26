// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "SwiftObjcIntegration",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "SwiftObjcIntegration", type: .dynamic, targets: ["SwiftObjcIntegration"]),
    ],
    targets: [
        .target(
            name: "SwiftObjcIntegration", // 全体のターゲット名
            dependencies: [],
            path: "Sources",
            sources: ["Swift/test.swift", "ObjC/test.m"], // Swift と ObjC のファイルを指定
            cSettings: [
                .headerSearchPath("Sources/ObjC")
            ]
        ),
    ]
)

