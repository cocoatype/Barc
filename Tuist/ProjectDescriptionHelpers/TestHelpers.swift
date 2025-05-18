import ProjectDescription

public enum TestHelpers {
    public static let target = Target.target(
        name: "BarcTestHelpers",
        destinations: [.iPhone],
        product: .framework,
        bundleId: "com.cocoatype.Highlighter.TestHelpers",
        sources: ["Modules/TestHelpers/Sources/**"],
        dependencies: [
            .target(interfaceTarget),
            .xctest,
        ],
        settings: .settings(
            base: [
                "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": false,
                "ENABLE_MODULE_VERIFIER": true,
                "MODULE_VERIFIER_SUPPORTED_LANGUAGE_STANDARDS": ["gnu11", "gnu++14"],
            ]
        )
    )

    public static let interfaceTarget = Target.target(
        name: "BarcTestHelpersInterface",
        destinations: [.iPhone],
        product: .framework,
        bundleId: "com.cocoatype.Highlighter.TestHelpersInterface",
        sources: ["Modules/TestHelpers/Interface/**"],
        settings: .settings(
            base: [
                "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": false,
                "ENABLE_MODULE_VERIFIER": true,
                "MODULE_VERIFIER_SUPPORTED_LANGUAGE_STANDARDS": ["gnu11", "gnu++14"],
            ]
        )
    )
}
