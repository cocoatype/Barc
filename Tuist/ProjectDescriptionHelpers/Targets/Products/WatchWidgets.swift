import ProjectDescription

public enum WatchWidgets {
    public static let target = Target.target(
        name: "WatchWidgets",
        destinations: [.appleWatch],
        product: .appExtension,
        bundleId: "com.cocoatype.Barc.Watch.Widgets",
        infoPlist: "Products/Widgets/Info.plist",
        sources: [
            "Products/WatchWidgets/Sources/**",
        ],
        resources: .resources([
            "Products/WatchWidgets/Resources/**",
        ]),
        entitlements: "Products/WatchWidgets/WatchWidgets.entitlements",
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.target),
            .target(Persistence.target),
            .external(name: "FactoryKit"),
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
