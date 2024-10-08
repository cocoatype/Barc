import ProjectDescription

public enum Shortcuts {
    public static let target = Target.moduleTarget(
        name: "Shortcuts",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeGenerator.target),
            .target(ErrorHandling.target),
            .target(Navigation.target),
            .target(Persistence.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Shortcuts",
        dependencies: [
        ]
    )
}
