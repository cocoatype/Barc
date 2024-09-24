import ProjectDescription

public enum Persistence {
    public static let target = Target.moduleTarget(
        name: "Persistence",
        destinations: [.iPhone, .appleWatch],
        hasResources: true,
        usesMaxSwiftVersion: false,
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Persistence",
        dependencies: [
        ]
    )

    public static let doublesTarget = Target.moduleDoublesTarget(
        name: "Persistence"
    )
}
