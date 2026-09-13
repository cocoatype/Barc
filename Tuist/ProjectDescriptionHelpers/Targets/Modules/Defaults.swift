import ProjectDescription

public enum Defaults {
    public static let target = Target.moduleTarget(
        name: "Defaults",
        dependencies: [
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Defaults",
        dependencies: [
            .target(TestHelpers.target),
        ]
    )

    public static let doublesTarget = Target.moduleDoublesTarget(
        name: "Defaults",
        dependencies: [
        ]
    )
}
