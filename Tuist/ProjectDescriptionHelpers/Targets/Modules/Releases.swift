import ProjectDescription

public enum Releases {
    public static let target = Target.moduleTarget(
        name: "Releases",
        dependencies: [
            .target(Defaults.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Releases",
        dependencies: [
            .target(Defaults.target),
            .target(Defaults.doublesTarget),
            .target(Releases.doublesTarget),
        ]
    )

    public static let doublesTarget = Target.moduleDoublesTarget(
        name: "Releases",
        dependencies: [
        ]
    )
}
