// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "taskinator",
  platforms: [.macOS(.v12)],
  dependencies: [
    .package(
      url: "https://github.com/apple/swift-argument-parser.git",
      from: "1.0.0"),
    .package(
      url: "https://github.com/onevcat/Rainbow",
      .upToNextMajor(from: "4.0.0")
    )
  ],
  targets: [
    .executableTarget(
      name: "taskinator",
      dependencies: [
        .product(
          name: "ArgumentParser",
          package: "swift-argument-parser"),
        .product(
          name: "Rainbow",
          package: "rainbow"),
      ]),
    .testTarget(
      name: "taskinatorTests",
      dependencies: ["taskinator"]),
  ]
)
