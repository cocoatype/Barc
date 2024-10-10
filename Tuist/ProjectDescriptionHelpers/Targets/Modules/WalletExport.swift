import ProjectDescription

public enum WalletExport {
    public static let target = Target.moduleTarget(
        name: "WalletExport",
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "WalletExport",
        dependencies: [
        ]
    )
}
