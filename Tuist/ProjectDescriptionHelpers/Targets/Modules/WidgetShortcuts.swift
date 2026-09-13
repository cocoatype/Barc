import ProjectDescription

public enum WidgetShortcuts {
    public static let target = Target.moduleTarget(
        name: "WidgetShortcuts",
        destinations: [.iPhone, .appleWatch],
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(ShortcutsModels.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "WidgetShortcuts",
        dependencies: [
            .target(ShortcutsModels.target),
        ]
    )
}
