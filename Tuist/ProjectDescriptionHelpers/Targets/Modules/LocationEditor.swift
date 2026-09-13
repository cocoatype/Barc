import ProjectDescription

public enum LocationEditor {
    public static let target = Target.moduleTarget(
        name: "LocationEditor",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(DesignSystem.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "LocationEditor",
        dependencies: [
        ]
    )
}
