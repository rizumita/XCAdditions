// swift-tools-version:5.3

import Foundation
import PackageDescription

private let moveToHomePackage = "MoveToHome"
private let testsPrefix = "Tests"

var package = Package(
  name: "XCAdditions",
  platforms: [
    .macOS(.v10_15),
  ],
  products: [
    .library(name: moveToHomePackage, targets: [moveToHomePackage]),
  ],
  targets: [
    .target(name: moveToHomePackage),
    .testTarget(name: moveToHomePackage + testsPrefix, dependencies: [.target(name: moveToHomePackage)])
  ]
)
