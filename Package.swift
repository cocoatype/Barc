// swift-tools-version: 5.9
import PackageDescription

#if TUIST
import ProjectDescription
import ProjectDescriptionHelpers

let watchCompatibility: SettingsDictionary = ["TARGETED_DEVICE_FAMILY": "1,4"]

let packageSettings = PackageSettings(
    productTypes: [
        "BigInt": .framework,
        "PDF417": .framework,
        "TelemetryClient": .framework,
        "SwiftUIIntrospect": .framework,
    ],
    baseSettings: Shared.settings,
    targetSettings: [
        "BigInt": watchCompatibility,
        "PDF417": watchCompatibility,
        "QRCodeGenerator": watchCompatibility,
        "TelemetryClient": watchCompatibility,
    ]
)
#endif

let package = Package(
    name: "Dependencies",
    dependencies: [
        .package(url: "git@github.com:cocoatype/PDF417.git", branch: "trunk"),
        .package(url: "git@github.com:fwcd/swift-qrcode-generator.git", from: "2.0.2"),
        .package(url: "git@github.com:nalexn/ViewInspector.git", from: "0.10.1"),
        .package(url: "git@github.com:RevenueCat/purchases-ios-spm.git", from: "5.0.0"),
        .package(url: "git@github.com:siteline/swiftui-introspect.git", from: "1.3.0"),
        .package(url: "git@github.com:TelemetryDeck/SwiftClient.git", from: "2.8.0"),
    ]
)
