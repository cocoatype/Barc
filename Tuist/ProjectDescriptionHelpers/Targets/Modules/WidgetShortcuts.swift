import ProjectDescription

public enum WidgetShortcuts {
    public static let target = Target.moduleTarget(
        name: "WidgetShortcuts",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.target),
            .target(ShortcutsModels.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "WidgetShortcuts",
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.target),
            .target(ErrorHandling.doublesTarget),
            .target(ShortcutsModels.target),
        ]
    )
}
