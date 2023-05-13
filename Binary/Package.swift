// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Darwin.POSIX
import PackageDescription

let theosPath: String = .init(cString: getenv("HOME")) + "/theos"
let minFirmware: String = "15.0"

let swiftFlags: [String] = [
    "-F\(theosPath)/vendor/lib",
    "-F\(theosPath)/lib",
    "-I\(theosPath)/vendor/include",
    "-I\(theosPath)/include",
    "-target", "arm64-apple-ios\(minFirmware)",
    "-sdk", "\(theosPath)/sdks/iPhoneOS16.0.sdk",
    "-resource-dir", "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift"
]

let package: Package = .init(
    name: "Xinamine",
    platforms: [.iOS(minFirmware)],
    targets: [
        .executableTarget(
            name: "Xinamine",
            swiftSettings: [.unsafeFlags(swiftFlags)]
        )
    ]
)
