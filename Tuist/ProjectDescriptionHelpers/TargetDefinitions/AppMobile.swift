import ProjectDescription

public enum AppMobile {
    public static let target = Target(
        name: "BarcAppMobile",
        platform: .iOS,
        product: .app,
        bundleId: "com.cocoatype.Barc",
        infoPlist: .extendingDefault(with: [
            "UILaunchStoryboardName": "LaunchScreen.storyboard",
        ]),
        sources: [
            "App/Mobile/Sources/**",
        ],
        resources: [
            "App/Mobile/Resources/**",
        ],
        dependencies: [
            .target(BarcodeGenerator.target),
        ]
    )
}
