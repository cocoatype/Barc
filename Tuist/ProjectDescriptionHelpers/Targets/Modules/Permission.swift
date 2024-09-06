import ProjectDescription

public enum Permission {
    public static let target = Target.moduleTarget(
        name: "Permission",
        dependencies: [
            .target(ErrorHandling.target),
        ]
    )

    public static let doublesTarget = Target.moduleDoublesTarget(
        name: "Permission"
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Permission",
        dependencies: [
        ]
    )
}
