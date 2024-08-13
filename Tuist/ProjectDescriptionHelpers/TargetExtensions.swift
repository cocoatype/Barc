import ProjectDescription

extension Target {
    static func moduleTarget(
        name: String,
        sdk: SDK = .catalyst,
        hasResources: Bool = false,
        usesMaxSwiftVersion: Bool = true,
        dependencies: [TargetDependency] = []
    ) -> Target {
        Target.target(
            name: name + sdk.nameSuffix,
            destinations: sdk.destinations,
            product: .framework,
            bundleId: "com.cocoatype.Barc.\(name)",
            sources: ["Modules/\(name)/Sources/**"],
            resources: hasResources ? ["Modules/\(name)/Resources/**"] : nil,
            dependencies: dependencies,
            settings: .settings(
                base: [
                    "CODE_SIGN_IDENTITY": "",
                    "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": false,
                    "ENABLE_MODULE_VERIFIER": true,
                    "MODULE_VERIFIER_SUPPORTED_LANGUAGE_STANDARDS": ["gnu11", "gnu++14"],
                    "SWIFT_VERSION": (usesMaxSwiftVersion ? "$(SWIFT_MAX_VERSION)" : "$(inherited)"),
                ]
            )
        )
    }

    static func moduleTestTarget(
        name: String,
        sdk: SDK = .catalyst,
        hasResources: Bool = false,
        dependencies: [TargetDependency] = []
    ) -> Target {
        return Target.target(
            name: "\(name + sdk.nameSuffix)Tests",
            destinations: sdk.destinations,
            product: .unitTests,
            bundleId: "com.cocoatype.Barc.\(name + sdk.nameSuffix)Tests",
            sources: ["Modules/\(name)/Tests/**"],
            resources: hasResources ? ["Modules/\(name)/TestResources/**"] : nil,
            dependencies: [.target(name: name + sdk.nameSuffix)] + dependencies
        )
    }

    static func moduleDoublesTarget(
        name: String,
        sdk: SDK = .catalyst
    ) -> Target {
        return Target.target(
            name: "\(name + sdk.nameSuffix)Doubles",
            destinations: sdk.destinations,
            product: .framework,
            bundleId: "com.cocoatype.Barc.\(name + sdk.nameSuffix)Doubles",
            sources: ["Modules/\(name)/Doubles/**"],
            dependencies: [
                .target(name: name + sdk.nameSuffix),
                .target(TestHelpers.interfaceTarget),
            ],
            settings: .settings(
                base: [
                    "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": false,
                ],
                defaultSettings: .recommended(excluding: [
                    "CODE_SIGN_IDENTITY",
                ])
            )
        )
    }
}
