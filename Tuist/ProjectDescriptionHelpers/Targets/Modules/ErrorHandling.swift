import ProjectDescription

public enum ErrorHandling {
    public static let target = Target.moduleTarget(
        name: "ErrorHandling",
        dependencies: [
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ErrorHandling",
        dependencies: [
        ]
    )
}
