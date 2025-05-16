import ProjectDescription

public enum Library {
    public static let target = Target.moduleTarget(
        name: "Library",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeGenerator.target),
            .target(DesignSystem.target),
            .target(ErrorHandling.target),
            .target(Location.target),
            .target(Persistence.target),
            .target(PhotoLibrary.target),
            .target(Routing.target),
            .target(Triggers.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Library",
        dependencies: [
        ]
    )
}
