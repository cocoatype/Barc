import ProjectDescription

public enum WatchWidgets {
    public static let target = Target.target(
        name: "WatchWidgets",
        destinations: [.appleWatch],
        product: .appExtension,
        bundleId: "com.cocoatype.Barc.Watch.Widgets",
        infoPlist: "Products/Widgets/Info.plist",
        sources: [
            "Products/Widgets/Sources/**",
        ],
        resources: .resources([
            "Products/Widgets/Resources/**",
        ]),
        entitlements: "Products/Widgets/Widgets.entitlements",
        dependencies: [
            .target(WidgetShortcuts.target),
            .target(WidgetContents.target),
        ],
        settings: .settings(
            base: [
                "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": "NO",
                "TARGETED_DEVICE_FAMILY": "4",
            ],
            debug: [
                "PROVISIONING_PROFILE_SPECIFIER": "match Development com.cocoatype.Barc.Watch.Widgets",
                "ENABLE_DEBUG_DYLIB": true,
            ], release: [
                "PROVISIONING_PROFILE_SPECIFIER": "match AppStore com.cocoatype.Barc.Watch.Widgets",
            ],
            defaultSettings: .recommended(excluding: [
                "CODE_SIGN_IDENTITY",
            ])
        )
    )
}
