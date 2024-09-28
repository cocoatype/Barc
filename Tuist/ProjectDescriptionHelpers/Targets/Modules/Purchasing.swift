import ProjectDescription

public enum Purchasing {
    public static let target = Target.moduleTarget(
        name: "Purchasing",
        hasResources: true,
        dependencies: [
            .target(ErrorHandling.target),
            .target(Paywall.target),
            .external(name: "RevenueCat"),
            .external(name: "RevenueCatUI"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Purchasing",
        dependencies: [
        ]
    )

    public static let doublesTarget = Target.moduleDoublesTarget(
        name: "Purchasing"
    )
}
