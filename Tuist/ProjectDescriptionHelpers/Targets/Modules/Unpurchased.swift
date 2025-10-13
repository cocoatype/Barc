import ProjectDescription

public enum Unpurchased {
    public static let target = Target.moduleTarget(
        name: "Unpurchased",
        hasResources: true,
        dependencies: [
            .target(DesignSystem.target),
            .target(ErrorHandling.target),
            .target(Logging.target),
            .target(Paywall.target),
            .target(Purchasing.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Unpurchased",
        dependencies: [
            .target(DesignSystem.target),
        ]
    )
}
