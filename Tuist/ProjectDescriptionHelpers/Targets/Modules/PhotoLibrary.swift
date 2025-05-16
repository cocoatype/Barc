import ProjectDescription

public enum PhotoLibrary {
    public static let target = Target.moduleTarget(
        name: "PhotoLibrary",
        hasResources: true,
        dependencies: [
            .target(AppShortcuts.target),
            .target(BarcodeEdit.target),
            .target(Barcodes.target),
            .target(ErrorHandling.target),
            .target(ImageReader.target),
            .target(Persistence.target),
            .target(ReviewRequest.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "PhotoLibrary",
        dependencies: [
            .external(name: "ViewInspector"),
        ]
    )
}
