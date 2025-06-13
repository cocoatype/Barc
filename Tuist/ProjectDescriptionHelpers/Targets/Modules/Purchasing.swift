import ProjectDescription

public enum Purchasing {
    public static let target = Target.moduleTarget(
        name: "Purchasing",
        hasResources: true,
        dependencies: [
            .target(ErrorHandling.target),
            .external(name: "FactoryKit"),
            .external(name: "RevenueCat"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Purchasing",
        dependencies: [
            .target(Purchasing.doublesTarget),
            .external(name: "FactoryKit"),
            .external(name: "FactoryTesting"),
            .external(name: "ViewInspector"),
        ]
    )

    public static let doublesTarget = Target.moduleDoublesTarget(
        name: "Purchasing"
    )
}
