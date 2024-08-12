import ProjectDescription

public enum App {
    public static let target = Target.target(
        name: "Barc",
        destinations: SDK.catalyst.destinations,
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
            .target(BarcodeGenerator.target),
            .target(Library.target),
            .target(ManualEntry.target),
        ],
        settings: .settings(
            base: [
                "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": "NO",
                "TARGETED_DEVICE_FAMILY": "1,2,6",
            ],
            debug: [
                "PROVISIONING_PROFILE_SPECIFIER": "match Development com.cocoatype.Highlighter",
                "ENABLE_DEBUG_DYLIB": false,
            ], release: [
                "PROVISIONING_PROFILE_SPECIFIER": "match AppStore com.cocoatype.Highlighter",
            ],
            defaultSettings: .recommended(excluding: [
                "CODE_SIGN_IDENTITY",
            ])
        )
    )
}
