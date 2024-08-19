import ProjectDescription

public enum Shared {
    public static let settings: Settings = .settings(base: [
        "ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS": false,
        "ASSETCATALOG_COMPILER_GLOBAL_ACCENT_COLOR_NAME": "Accent Color",
        "CODE_SIGN_STYLE": "Manual",
        "CURRENT_PROJECT_VERSION": "0",
        "DERIVE_MACCATALYST_PRODUCT_BUNDLE_IDENTIFIER": "NO",
        "DEVELOPMENT_TEAM": "287EDDET2B",
        "ENABLE_HARDENED_RUNTIME[sdk=macosx*]": "YES",
        "ENABLE_USER_SCRIPT_SANDBOXING": true,
        "IPHONEOS_DEPLOYMENT_TARGET": "17.0",
        "MACOSX_DEPLOYMENT_TARGET": "12.0",
        "MARKETING_VERSION": "999",
        "SWIFT_VERSION": "5.0",
        "SWIFT_MAX_VERSION_1500": "5.0",
        "SWIFT_MAX_VERSION_1600": "6.0",
        "SWIFT_MAX_VERSION": "$(SWIFT_MAX_VERSION_$(XCODE_VERSION_MAJOR))",
        "TARGETED_DEVICE_FAMILY": "1",
    ], debug: [
        "CODE_SIGN_IDENTITY": "Apple Development: Buddy Build (D47V8Y25W5)",
    ], release: [
        "CODE_SIGN_IDENTITY": "Apple Distribution",
    ])
}
