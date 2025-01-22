import ProjectDescription

public enum ShortcutsModels {
    public static let target = Target.moduleTarget(
        name: "ShortcutsModels",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeGenerator.target),
            .target(ErrorHandling.target),
            .target(Persistence.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ShortcutsModels",
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.doublesTarget),
        ]
    )
}
