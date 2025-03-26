// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "MixedLanguagePackage",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "MixedLanguagePackage",
            targets: ["MixedLanguagePackage"]
        ),
    ],
    targets: [
        .target(
            name: "MixedLanguagePackage",
            path: "Sources",
            exclude: ["ObjC/test.h"], // 公開しないヘッダーは除外
            publicHeadersPath: "ObjC", // 公開ヘッダーのディレクトリ
            cSettings: [
                .headerSearchPath("ObjC"), // ヘッダー検索パス
            ]
        )
    ]
)
