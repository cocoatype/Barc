import ProjectDescription

public enum WidgetContents {
    public static let target = Target.moduleTarget(
        name: "WidgetContents",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeGenerator.target),
            .target(ErrorHandling.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "WidgetContents",
        dependencies: [
        ]
    )
}
