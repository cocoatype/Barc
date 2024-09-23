import ProjectDescription

public enum ErrorHandling {
    public static let target = Target.moduleTarget(
        name: "ErrorHandling",
        destinations: [.iPhone, .appleWatch, .mac],
        usesMaxSwiftVersion: false,
        dependencies: [
            .target(Logging.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ErrorHandling",
        dependencies: [
            .target(ErrorHandling.doublesTarget),
            .target(TestHelpers.target),
        ]
    )

    public static let doublesTarget = Target.moduleDoublesTarget(name: "ErrorHandling")
}
