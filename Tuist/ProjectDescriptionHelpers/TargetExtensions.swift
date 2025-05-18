import ProjectDescription

extension Target {
    static func moduleTarget(
        name: String,
        destinations: Destinations = [.iPhone],
        hasResources: Bool = false,
        usesMaxSwiftVersion: Bool = true,
        dependencies: [TargetDependency] = []
    ) -> Target {
        Target.target(
            name: "Barc\(name)",
            destinations: destinations,
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
        hasResources: Bool = false,
        dependencies: [TargetDependency] = []
    ) -> Target {
        return Target.target(
            name: "Barc\(name)Tests",
            destinations: [.iPhone],
            product: .unitTests,
            bundleId: "com.cocoatype.Barc.\(name)Tests",
            sources: ["Modules/\(name)/Tests/**"],
            resources: hasResources ? ["Modules/\(name)/TestResources/**"] : nil,
            dependencies: [
                .target(name: "Barc\(name)"),
                .target(TestHelpers.target),
            ] + dependencies,
            settings: .settings(
                base: [
                    "SWIFT_VERSION": "$(SWIFT_MAX_VERSION)",
                ]
            )
        )
    }

    static func moduleDoublesTarget(
        name: String,
        dependencies: [TargetDependency] = []
    ) -> Target {
        return Target.target(
            name: "Barc\(name)Doubles",
            destinations: [.iPhone],
            product: .framework,
            bundleId: "com.cocoatype.Barc.\(name)Doubles",
            sources: ["Modules/\(name)/Doubles/**"],
            dependencies: [
                .target(name: "Barc\(name)"),
                .target(TestHelpers.interfaceTarget),
            ] + dependencies,
            settings: .settings(
                base: [
                    "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": false,
                    "SWIFT_VERSION": "$(SWIFT_MAX_VERSION)",
                ],
                defaultSettings: .recommended(excluding: [
                    "CODE_SIGN_IDENTITY",
                ])
            )
        )
    }
}
