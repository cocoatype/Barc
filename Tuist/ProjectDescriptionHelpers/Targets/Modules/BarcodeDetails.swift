import ProjectDescription

public enum BarcodeDetails {
    public static let target = Target.moduleTarget(
        name: "BarcodeDetails",
        hasResources: true,
        usesMaxSwiftVersion: false,
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeEdit.target),
            .target(BarcodeView.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "BarcodeDetails",
        dependencies: [
        ]
    )
}
