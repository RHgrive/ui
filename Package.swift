// swift-tools-version: 5.10
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
            name: "ui",
            path: "Sources",
            sources: ["Swift/test.swift", "ObjC/test.m"],  // 明示的にファイル指定
            publicHeadersPath: "ObjC",  // ヘッダーファイルの場所
            cSettings: [
                .headerSearchPath("ObjC"),  // ヘッダー検索パス
                .unsafeFlags(["-fmodules"])  // モジュールサポートを有効化（CIで必要になる場合あり）
            ]
        )
    ]
)
