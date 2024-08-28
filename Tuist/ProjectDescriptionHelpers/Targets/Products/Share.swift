import ProjectDescription

public enum Share {
    public static let target = Target.target(
        name: "Share",
        destinations: [.iPhone],
        product: .appExtension,
        bundleId: "com.cocoatype.Barc.Share",
        infoPlist: "Products/Share/Info.plist",
        sources: [
            "Products/Share/Sources/**",
        ],
        entitlements: "Products/Share/Share.entitlements",
        dependencies: [
            .target(ShareContents.target),
        ],
        settings: .settings(
            base: [
                "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": "NO",
                "TARGETED_DEVICE_FAMILY": "1",
            ],
            debug: [
                "PROVISIONING_PROFILE_SPECIFIER": "match Development com.cocoatype.Barc.Share",
                "ENABLE_DEBUG_DYLIB": true,
            ], release: [
                "PROVISIONING_PROFILE_SPECIFIER": "match AppStore com.cocoatype.Barc.Share",
            ],
            defaultSettings: .recommended(excluding: [
                "CODE_SIGN_IDENTITY",
            ])
        )
    )
}
