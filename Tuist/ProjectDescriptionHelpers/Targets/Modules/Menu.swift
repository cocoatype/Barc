import ProjectDescription

public enum Menu {
    public static let target = Target.moduleTarget(
        name: "Menu",
        hasResources: true,
        dependencies: [
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Menu",
        dependencies: [
        ]
    )
}
