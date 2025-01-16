import ProjectDescription

public enum Menu {
    public static let target = Target.moduleTarget(
        name: "Menu",
        hasResources: true,
        dependencies: [
            .target(ErrorHandling.target),
            .target(Onboarding.target),
            .target(Purchasing.target),
            .target(Releases.target),
            .target(Web.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Menu",
        dependencies: [
        ]
    )
}
