import ProjectDescription

public enum BarcodeGenerator {
    public static let target = Target.moduleTarget(
        name: "BarcodeGenerator",
        destinations: [.iPhone, .appleWatch],
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(DesignSystem.target),
            .target(ErrorHandling.target),
            .external(name: "FactoryKit"),
            .external(name: "QRCodeGenerator"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "BarcodeGenerator",
        dependencies: [
            .target(Barcodes.target),
        ]
    )
}
