import ProjectDescription

public enum ErrorHandling {
    public static let target = Target.moduleTarget(
        name: "ErrorHandling",
        usesMaxSwiftVersion: false,
        dependencies: [
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ErrorHandling",
        dependencies: [
        ]
    )
}
