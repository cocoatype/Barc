import ProjectDescription

public enum Releases {
    public static let target = Target.moduleTarget(
        name: "Releases",
        dependencies: [
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Releases",
        dependencies: [
        ]
    )
}
