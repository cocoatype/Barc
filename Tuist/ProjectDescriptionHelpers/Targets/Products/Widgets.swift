import ProjectDescription

public enum Widgets {
    public static let target = Target.target(
        name: "Widgets",
        destinations: [.iPhone],
        product: .appExtension,
        bundleId: "com.cocoatype.Barc.Widgets",
        infoPlist: "Products/Widgets/Info.plist",
        sources: [
            "Products/Widgets/Sources/**",
        ],
        dependencies: [
            .target(WidgetContents.target),
        ],
        settings: .settings(
            base: [
                "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": "NO",
                "TARGETED_DEVICE_FAMILY": "1",
            ],
            debug: [
                "PROVISIONING_PROFILE_SPECIFIER": "match Development com.cocoatype.Barc.Widgets",
                "ENABLE_DEBUG_DYLIB": true,
            ], release: [
                "PROVISIONING_PROFILE_SPECIFIER": "match AppStore com.cocoatype.Barc.Widgets",
            ],
            defaultSettings: .recommended(excluding: [
                "CODE_SIGN_IDENTITY",
            ])
        )
    )
}
