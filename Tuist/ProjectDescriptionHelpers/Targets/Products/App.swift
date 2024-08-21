import ProjectDescription

public enum App {
    public static let target = Target.target(
        name: "Barc",
        destinations: [.iPhone],
        product: .app,
        bundleId: "com.cocoatype.Barc",
        infoPlist: "App/Mobile/Info.plist",
        sources: [
            "App/Mobile/Sources/**",
        ],
        resources: .resources([
            "App/Mobile/Resources/**",
        ]),
        dependencies: [
            .target(Root.target),
            .target(Shortcuts.target),
        ],
        settings: .settings(
            base: [
                "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": "NO",
                "TARGETED_DEVICE_FAMILY": "1",
            ],
            debug: [
                "PROVISIONING_PROFILE_SPECIFIER": "match Development com.cocoatype.Barc",
                "ENABLE_DEBUG_DYLIB": true,
            ], release: [
                "PROVISIONING_PROFILE_SPECIFIER": "match AppStore com.cocoatype.Barc",
            ],
            defaultSettings: .recommended(excluding: [
                "CODE_SIGN_IDENTITY",
            ])
        )
    )
}
