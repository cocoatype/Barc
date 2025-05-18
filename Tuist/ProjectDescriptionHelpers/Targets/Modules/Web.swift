import ProjectDescription

public enum Web {
    public static let target = Target.moduleTarget(
        name: "Web",
        dependencies: [
            .target(ErrorHandling.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Web",
        dependencies: [
        ]
    )
}
