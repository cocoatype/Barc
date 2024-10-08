// swift-tools-version: 5.9
import PackageDescription

#if TUIST
import ProjectDescription
import ProjectDescriptionHelpers

let packageSettings = PackageSettings(
    productTypes: [
        "TelemetryClient": .framework,
        "SwiftUIIntrospect": .framework,
    ],
    baseSettings: Shared.settings,
    targetSettings: [
        :
    ]
)
#endif

let package = Package(
    name: "Dependencies",
    dependencies: [
        .package(url: "git@github.com:TelemetryDeck/SwiftClient.git", from: "1.0.0"),
        .package(url: "git@github.com:siteline/swiftui-introspect.git", from: "1.3.0"),
        .package(url: "git@github.com:fwcd/swift-qrcode-generator.git", from: "2.0.2"),
        .package(url: "git@github.com:RevenueCat/purchases-ios-spm.git", from: "5.0.0"),
    ]
)
