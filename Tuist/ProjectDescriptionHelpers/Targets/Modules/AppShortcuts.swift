import ProjectDescription

public enum AppShortcuts {
    public static let target = Target.moduleTarget(
        name: "AppShortcuts",
        hasResources: true,
        dependencies: [
            .target(BarcodeGenerator.target),
            .target(Barcodes.target),
            .target(ErrorHandling.target),
            .target(ImageReader.target),
            .target(Persistence.target),
            .target(Routing.target),
            .target(ShortcutsModels.target),
            .external(name: "PDF417"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "AppShortcuts",
        dependencies: [
            .target(ShortcutsModels.target),
        ]
    )
}
