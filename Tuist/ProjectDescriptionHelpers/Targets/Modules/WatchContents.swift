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
            .target(Navigation.target),
            .target(Persistence.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "WatchContents",
        dependencies: [
        ]
    )
}
