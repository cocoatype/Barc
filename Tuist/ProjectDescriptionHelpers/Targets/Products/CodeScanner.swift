import ProjectDescription

public enum CodeScanner {
    public static let target = Target.target(
        name: "CodeScanner",
        destinations: [.mac],
        product: .app,
        bundleId: "com.cocoatype.Barc.CodeScanner",
        infoPlist: "Products/CodeScanner/Info.plist",
        sources: [
            "Products/CodeScanner/Sources/**",
        ],
        entitlements: "Products/CodeScanner/CodeScanner.entitlements",
        dependencies: [
            .target(ImageReader.target),
        ],
        settings: .settings(
            base: [
                "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": "NO",
                "TARGETED_DEVICE_FAMILY": "1",
            ],
            debug: [
                "PROVISIONING_PROFILE_SPECIFIER": "match Development com.cocoatype.Barc.CodeScanner",
                "ENABLE_DEBUG_DYLIB": true,
            ], release: [
                "PROVISIONING_PROFILE_SPECIFIER": "match AppStore com.cocoatype.Barc.CodeScanner",
            ],
            defaultSettings: .recommended(excluding: [
                "CODE_SIGN_IDENTITY",
            ])
        )
    )
}
