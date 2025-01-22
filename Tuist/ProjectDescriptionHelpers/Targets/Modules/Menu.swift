import ProjectDescription

public enum Menu {
    public static let target = Target.moduleTarget(
        name: "Menu",
        hasResources: true,
        dependencies: [
            .target(Defaults.target),
            .target(ErrorHandling.target),
            .target(Onboarding.target),
            .target(Paywall.target),
            .target(Purchasing.target),
            .target(Releases.target),
            .target(TestHelpers.interfaceTarget),
            .target(Web.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Menu",
        dependencies: [
            .target(Defaults.doublesTarget),
            .target(Releases.doublesTarget),
            .external(name: "ViewInspector"),
        ]
    )
}
