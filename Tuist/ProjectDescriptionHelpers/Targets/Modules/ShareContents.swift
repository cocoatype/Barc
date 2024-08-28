import ProjectDescription

public enum ShareContents {
    public static let target = Target.moduleTarget(
        name: "ShareContents",
        hasResources: true,
        dependencies: [
            .target(BarcodeEdit.target),
            .target(Barcodes.target),
            .target(DesignSystem.target),
            .target(ErrorHandling.target),
            .target(ImageReader.target),
            .target(Persistence.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ShareContents",
        dependencies: [
        ]
    )
}
