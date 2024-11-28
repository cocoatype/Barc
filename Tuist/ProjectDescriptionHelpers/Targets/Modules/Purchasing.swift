import ProjectDescription

public enum Purchasing {
    public static let target = Target.moduleTarget(
        name: "Purchasing",
        hasResources: true,
        dependencies: [
            .target(ErrorHandling.target),
            .external(name: "RevenueCat"),
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
