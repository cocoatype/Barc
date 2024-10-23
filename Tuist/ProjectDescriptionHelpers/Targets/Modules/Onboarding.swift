import ProjectDescription

public enum Onboarding {
    public static let target = Target.moduleTarget(
        name: "Onboarding",
        hasResources: true,
        dependencies: [
            .target(DesignSystem.target),
            .target(Paywall.target),
            .target(Permission.target),
            .target(Purchasing.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Onboarding",
        dependencies: [
        ]
    )
}
