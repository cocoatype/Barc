import ProjectDescription

public enum Routing {
    public static let target = Target.moduleTarget(
        name: "Routing",
        destinations: [.iPhone, .appleWatch],
        dependencies: [
            .target(Barcodes.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Routing",
        dependencies: [
        ]
    )
}
