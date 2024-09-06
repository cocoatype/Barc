import ProjectDescription

public enum Menu {
    public static let target = Target.moduleTarget(
        name: "Menu",
        hasResources: true,
        dependencies: [
            .target(ErrorHandling.target),
            .target(Onboarding.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Menu",
        dependencies: [
        ]
    )
}
