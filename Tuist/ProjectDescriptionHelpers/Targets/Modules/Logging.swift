import ProjectDescription

public enum Logging {
    public static let target = Target.moduleTarget(
        name: "Logging",
        destinations: [.iPhone, .appleWatch],
        usesMaxSwiftVersion: false,
        dependencies: [
            .external(name: "TelemetryClient"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Logging",
        dependencies: [
            .external(name: "TelemetryClient"),
        ]
    )

    public static let doublesTarget = Target.moduleDoublesTarget(name: "Logging")
}
