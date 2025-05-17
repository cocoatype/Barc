import ProjectDescription

public enum BarcodeDetails {
    public static let target = Target.moduleTarget(
        name: "BarcodeDetails",
        hasResources: true,
        dependencies: [
            .target(AppShortcuts.target),
            .target(Barcodes.target),
            .target(BarcodeEdit.target),
            .target(BarcodeView.target),
            .target(ErrorHandling.target),
            .target(Persistence.target),
            .target(Purchasing.target),
            .target(WalletExport.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "BarcodeDetails",
        dependencies: [
        ]
    )
}
