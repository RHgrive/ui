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
        .target(
            name: "ObjCModule",
            path: "Sources/ObjC",
            exclude: ["include/module.modulemap"],
            publicHeadersPath: "include",  // モジュールマップ配置先
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("include"),
                .unsafeFlags(["-fmodules"])
            ]
        ),
        .target(
            name: "ui",
            dependencies: ["ObjCModule"],
            path: "Sources/Swift",
            linkerSettings: [
                .linkedLibrary("objc"),
                .unsafeFlags(["-Xlinker", "-rpath", "-Xlinker", "@executable_path/Frameworks"])
            ]
        )
    ]
)
