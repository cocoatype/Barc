import ProjectDescription

public enum WalletExport {
    public static let target = Target.moduleTarget(
        name: "WalletExport",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.target),
            .external(name: "FactoryKit"),
            .external(name: "PDF417"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "WalletExport",
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.doublesTarget),
            .external(name: "FactoryKit"),
            .external(name: "FactoryTesting"),
        ]
    )
}
