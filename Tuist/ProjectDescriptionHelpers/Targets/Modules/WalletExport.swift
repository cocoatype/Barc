import ProjectDescription

public enum WalletExport {
    public static let target = Target.moduleTarget(
        name: "WalletExport",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.target),
            .target(Purchasing.target),
            .target(Unpurchased.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "WalletExport",
        dependencies: [
            .target(Purchasing.doublesTarget),
        ]
    )
}
