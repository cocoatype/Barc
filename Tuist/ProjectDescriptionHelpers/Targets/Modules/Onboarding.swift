import ProjectDescription

public enum Onboarding {
    public static let target = Target.moduleTarget(
        name: "Onboarding",
        hasResources: true,
        dependencies: [
            .target(DesignSystem.target),
            .target(Permission.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Onboarding",
        dependencies: [
        ]
    )
}
