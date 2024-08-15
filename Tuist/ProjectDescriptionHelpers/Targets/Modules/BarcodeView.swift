import ProjectDescription

public enum BarcodeView {
    public static let target = Target.moduleTarget(
        name: "BarcodeView",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeGenerator.target),
            .target(DesignSystem.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "BarcodeView",
        dependencies: [
        ]
    )
}
