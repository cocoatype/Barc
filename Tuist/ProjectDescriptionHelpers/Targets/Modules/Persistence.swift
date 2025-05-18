import ProjectDescription

public enum Persistence {
    public static let target = Target.moduleTarget(
        name: "Persistence",
        destinations: [.iPhone, .appleWatch],
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.target),
            .external(name: "FactoryKit"),
            .external(name: "PDF417"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Persistence",
        dependencies: [
        ]
    )

    public static let doublesTarget = Target.moduleDoublesTarget(
        name: "Persistence",
        dependencies: [
            .target(Barcodes.target),
        ]
    )
}
