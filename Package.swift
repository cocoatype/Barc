// swift-tools-version: 5.9
import PackageDescription

#if TUIST
import ProjectDescription
import ProjectDescriptionHelpers

let packageSettings = PackageSettings(
    productTypes: [
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
    ]
)
