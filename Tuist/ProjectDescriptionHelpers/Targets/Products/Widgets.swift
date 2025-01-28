import ProjectDescription

public enum Widgets {
    public static let target = Target.target(
        name: "Widgets",
        destinations: [.iPhone, .appleWatch],
        product: .appExtension,
        bundleId: "com.cocoatype.Barc.Widgets",
        infoPlist: "Products/Widgets/Info.plist",
        sources: [
            "Products/Widgets/Sources/**",
        ],
        entitlements: "Products/Widgets/Widgets.entitlements",
        dependencies: [
            .target(WidgetShortcuts.target),
            .target(WidgetContents.target),
        ],
        settings: .settings(
            base: [
                "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": "NO",
                "TARGETED_DEVICE_FAMILY": "1,4",
                "PRODUCT_BUNDLE_IDENTIFIER[sdk=watch*]": "com.cocoatype.Barc.Watch.Widgets",
            ],
            debug: [
                "PROVISIONING_PROFILE_SPECIFIER": "match Development com.cocoatype.Barc.Widgets",
                "PROVISIONING_PROFILE_SPECIFIER[sdk=watch*]": "match Development com.cocoatype.Barc.Watch.Widgets",
                "ENABLE_DEBUG_DYLIB": true,
            ], release: [
                "PROVISIONING_PROFILE_SPECIFIER": "match AppStore com.cocoatype.Barc.Widgets",
                "PROVISIONING_PROFILE_SPECIFIER[sdk=watch*]": "match AppStore com.cocoatype.Barc.Watch.Widgets",
            ],
            defaultSettings: .recommended(excluding: [
                "CODE_SIGN_IDENTITY",
            ])
        )
    )
}
