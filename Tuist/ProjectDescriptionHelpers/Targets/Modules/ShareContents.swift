import ProjectDescription

public enum ShareContents {
    public static let target = Target.moduleTarget(
        name: "ShareContents",
        hasResources: true,
        dependencies: [
            .target(AppShortcuts.target),
            .target(BarcodeEdit.target),
            .target(Barcodes.target),
            .target(DesignSystem.target),
            .target(ErrorHandling.target),
            .target(ImageReader.target),
            .target(Persistence.target),
            .target(Purchasing.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ShareContents",
        dependencies: [
            .target(Persistence.doublesTarget),
            .target(Purchasing.doublesTarget),
            .external(name: "FactoryKit"),
            .external(name: "FactoryTesting"),
        ]
    )
}
