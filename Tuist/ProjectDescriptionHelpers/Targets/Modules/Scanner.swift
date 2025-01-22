import ProjectDescription

public enum Scanner {
    public static let target = Target.moduleTarget(
        name: "Scanner",
        hasResources: true,
        dependencies: [
            .target(AppShortcuts.target),
            .target(Barcodes.target),
            .target(BarcodeEdit.target),
            .target(ErrorHandling.target),
            .target(ImageReader.target),
            .target(Persistence.target),
            .target(ReviewRequest.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Scanner",
        dependencies: [
        ]
    )
}
