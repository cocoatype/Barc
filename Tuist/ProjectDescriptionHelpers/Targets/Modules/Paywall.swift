import ProjectDescription

public enum Paywall {
    public static let target = Target.moduleTarget(
        name: "Paywall",
        hasResources: true,
        dependencies: [
            .target(DesignSystem.target),
            .target(ErrorHandling.target),
            .target(Logging.target),
            .target(Purchasing.target),
            .target(TestHelpers.interfaceTarget),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Paywall",
        dependencies: [
            .target(Logging.target),
            .target(Logging.doublesTarget),
            .target(Purchasing.target),
            .target(Purchasing.doublesTarget),
            .external(name: "FactoryKit"),
            .external(name: "FactoryTesting"),
            .external(name: "ViewInspector"),
        ]
    )
}
