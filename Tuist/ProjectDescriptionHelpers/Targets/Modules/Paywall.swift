import ProjectDescription

public enum Paywall {
    public static let target = Target.moduleTarget(
        name: "Paywall",
        hasResources: true,
        dependencies: [
            .target(DesignSystem.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Paywall",
        dependencies: [
        ]
    )
}
