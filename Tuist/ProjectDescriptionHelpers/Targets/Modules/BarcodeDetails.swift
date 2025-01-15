import ProjectDescription

public enum BarcodeDetails {
    public static let target = Target.moduleTarget(
        name: "BarcodeDetails",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeEdit.target),
            .target(BarcodeView.target),
            .target(ErrorHandling.target),
            .target(Persistence.target),
            .target(Shortcuts.target),
            .target(WalletExport.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "BarcodeDetails",
        dependencies: [
        ]
    )
}
