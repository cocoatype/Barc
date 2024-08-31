import ProjectDescription

public enum Watch {
    public static let target = Target.target(
        name: "BarcWatch",
        destinations: [.appleWatch],
        product: .app,
        bundleId: "com.cocoatype.Barc.Watch",
        infoPlist: "Products/Watch/Info.plist",
        sources: [
            "Products/Watch/Sources/**",
        ],
        resources: .resources([
            "Products/Watch/Resources/**",
        ]),
        entitlements: "Products/Watch/Watch.entitlements",
        dependencies: [
           .target(WatchContents.target),
        ],
        settings: .settings(
            base: [
                "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": "NO",
                "TARGETED_DEVICE_FAMILY": "4",
            ],
            debug: [
                "PROVISIONING_PROFILE_SPECIFIER": "match Development com.cocoatype.Barc.Watch",
                "ENABLE_DEBUG_DYLIB": true,
            ], release: [
                "PROVISIONING_PROFILE_SPECIFIER": "match AppStore com.cocoatype.Barc.Watch",
            ],
            defaultSettings: .recommended(excluding: [
                "CODE_SIGN_IDENTITY",
            ])
        )
    )
}
