import ProjectDescription

public enum WatchContents {
    public static let target = Target.moduleTarget(
        name: "WatchContents",
        destinations: [.appleWatch],
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeGenerator.target),
            .target(ErrorHandling.target),
            .target(Persistence.target),
            .target(Routing.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "WatchContents",
        dependencies: [
        ]
    )
}
