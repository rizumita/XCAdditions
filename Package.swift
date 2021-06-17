// swift-tools-version:5.3

import Foundation
import PackageDescription

private let basePackage = "Base"
private let moveToHomePackage = "MoveToHome"
private let startNewLinePackage = "StartNewLine"
private let testsPrefix = "Tests"

var package = Package(
  name: "XCAdditions",
  platforms: [
    .macOS(.v10_15),
  ],
  products: [
    .library(name: basePackage, targets: [basePackage]),
    .library(name: moveToHomePackage, targets: [moveToHomePackage]),
    .library(name: startNewLinePackage, targets: [startNewLinePackage]),
  ],
  targets: [
    .target(name: basePackage),
    .testTarget(name: basePackage + testsPrefix, dependencies: [.target(name: basePackage)]),
    .target(name: moveToHomePackage, dependencies: [.target(name: basePackage)]),
    .testTarget(name: moveToHomePackage + testsPrefix, dependencies: [.target(name: moveToHomePackage)]),
    .target(name: startNewLinePackage, dependencies: [.target(name: basePackage)]),
    .testTarget(name: startNewLinePackage + testsPrefix, dependencies: [.target(name: startNewLinePackage)]),
  ]
)
