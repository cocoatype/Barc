import ProjectDescription

public enum Defaults {
    public static let target = Target.moduleTarget(
        name: "Defaults",
        dependencies: [
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Defaults",
        dependencies: [
        ]
    )
}
