import ProjectDescription

public enum Unpurchased {
    public static let target = Target.moduleTarget(
        name: "Unpurchased",
        hasResources: true,
        dependencies: [
            .target(DesignSystem.target),
            .target(Paywall.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Unpurchased",
        dependencies: [
        ]
    )
}
