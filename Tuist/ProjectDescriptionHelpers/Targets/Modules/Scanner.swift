import ProjectDescription

public enum Scanner {
    public static let target = Target.moduleTarget(
        name: "Scanner",
        dependencies: [
            .target(ErrorHandling.target),
            .target(ImageReader.target),
            .target(Persistence.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Scanner",
        dependencies: [
        ]
    )
}