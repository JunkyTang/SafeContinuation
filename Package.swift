//
//  Package.swift
//  SafeContinuation
//
//  Created by junky on 2025/5/12.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SafeContinuation",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15) // 可选：支持 macOS
    ],
    products: [
        .library(
            name: "SafeContinuation",
            targets: ["SafeContinuation"]
        ),
    ],
    targets: [
        .target(
            name: "SafeContinuation",
            dependencies: [],
            path: "SafeContinuation/Classes"
        ),
        .testTarget(
            name: "SafeContinuationTests",
            dependencies: ["SafeContinuation"],
            path: "Example/Tests"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
