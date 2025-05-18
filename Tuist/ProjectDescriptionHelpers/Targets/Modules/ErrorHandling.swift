import ProjectDescription

public enum ErrorHandling {
    public static let target = Target.moduleTarget(
        name: "ErrorHandling",
        destinations: [.iPhone, .appleWatch, .mac],
        dependencies: [
            .target(Logging.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ErrorHandling",
        dependencies: [
            .target(ErrorHandling.doublesTarget),
        ]
    )

    public static let doublesTarget = Target.moduleDoublesTarget(name: "ErrorHandling")
}
