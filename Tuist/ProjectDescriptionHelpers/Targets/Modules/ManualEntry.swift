import ProjectDescription

public enum ManualEntry {
    public static let target = Target.moduleTarget(
        name: "ManualEntry",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.target),
            .target(Persistence.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ManualEntry",
        dependencies: [
        ]
    )
}
