// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "ui",
    platforms: [.iOS(.v17)],  // iOS 17 に明示的に合わせる
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
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("."),
                .unsafeFlags([
                    "-fmodules",
                    "-target", "arm64-apple-ios17.5",
                    "-isysroot", "/Applications/Xcode_15.4.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.5.sdk"
                ])
            ]
        ),
        .target(
            name: "ui",
            dependencies: ["ObjCModule"],
            path: "Sources/Swift",
            swiftSettings: [
                .unsafeFlags([
                    "-target", "arm64-apple-ios17.5",
                    "-sdk", "/Applications/Xcode_15.4.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS17.5.sdk"
                ])
            ],
            linkerSettings: [
                .linkedLibrary("objc"),
                .unsafeFlags(["-Xlinker", "-rpath", "-Xlinker", "@executable_path/Frameworks"])
            ]
        )
    ]
)
