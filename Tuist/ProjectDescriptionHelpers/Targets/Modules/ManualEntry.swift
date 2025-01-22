import ProjectDescription

public enum ManualEntry {
    public static let target = Target.moduleTarget(
        name: "ManualEntry",
        hasResources: true,
        dependencies: [
            .target(AppShortcuts.target),
            .target(Barcodes.target),
            .target(ErrorHandling.target),
            .target(Persistence.target),
            .target(ReviewRequest.target),
            .external(name: "PDF417"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ManualEntry",
        dependencies: [
        ]
    )
}
