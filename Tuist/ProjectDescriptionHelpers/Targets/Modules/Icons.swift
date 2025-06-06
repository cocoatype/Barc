import ProjectDescription

public enum Icons {
    public static let target = Target.moduleTarget(
        name: "Icons",
        hasResources: true,
        dependencies: [
            .target(ErrorHandling.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Icons",
        dependencies: [
        ]
    )
}
