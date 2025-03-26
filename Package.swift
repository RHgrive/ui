// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ui",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ui",
            type: .dynamic,  // 明示的に dynamic library を指定
            targets: ["ui"]
        ),
    ],
    targets: [
        .target(
            name: "ui",
            path: "Sources",
            sources: ["Swift/test.swift", "ObjC/test.m"],
            publicHeadersPath: "ObjC",
            cSettings: [
                .headerSearchPath("ObjC"),
                .unsafeFlags(["-fmodules"])
            ],
            linkerSettings: [
                .unsafeFlags(["-Xlinker", "-objc"])
            ]
        )
    ]
)
