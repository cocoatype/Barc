import ProjectDescription

public enum BarcodeEdit {
    public static let target = Target.moduleTarget(
        name: "BarcodeEdit",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeGenerator.target),
            .target(DesignSystem.target),
            .target(Navigation.target),
            .external(name: "SwiftUIIntrospect-Dynamic"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "BarcodeEdit",
        dependencies: [
        ]
    )
}
