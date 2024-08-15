import ProjectDescription

public enum Library {
    public static let target = Target.moduleTarget(
        name: "Library",
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeGenerator.target),
            .target(DesignSystem.target),
            .target(Persistence.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Library",
        dependencies: [
        ]
    )
}
