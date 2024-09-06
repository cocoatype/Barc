import ProjectDescription

public enum Navigation {
    public static let target = Target.moduleTarget(
        name: "Navigation",
        destinations: [.iPhone, .appleWatch],
        dependencies: [
            .target(Barcodes.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Navigation",
        dependencies: [
        ]
    )
}
