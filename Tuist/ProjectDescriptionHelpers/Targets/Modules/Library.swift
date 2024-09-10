import ProjectDescription

public enum Library {
    public static let target = Target.moduleTarget(
        name: "Library",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeGenerator.target),
            .target(DesignSystem.target),
            .target(Location.target),
            .target(Navigation.target),
            .target(Persistence.target),
            .target(Triggers.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Library",
        dependencies: [
        ]
    )
}
