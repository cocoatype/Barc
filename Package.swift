// swift-tools-version: 5.9
import PackageDescription

#if TUIST
import ProjectDescription
import ProjectDescriptionHelpers

let packageSettings = PackageSettings(
    productTypes: [
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
        .package(url: "git@github.com:siteline/swiftui-introspect.git", from: "1.3.0"),
    ]
)
