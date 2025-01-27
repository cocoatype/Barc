import ProjectDescription

public enum WidgetContents {
    public static let target = Target.moduleTarget(
        name: "WidgetContents",
        destinations: [.iPhone, .appleWatch],
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeGenerator.target),
            .target(ErrorHandling.target),
            .target(Persistence.target),
            .target(WidgetShortcuts.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "WidgetContents",
        dependencies: [
        ]
    )
}
