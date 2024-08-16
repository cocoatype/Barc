import ProjectDescription

public enum BarcodeView {
    public static let target = Target.moduleTarget(
        name: "BarcodeView",
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
        name: "BarcodeView",
        dependencies: [
        ]
    )
}
