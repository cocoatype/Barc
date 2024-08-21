import ProjectDescription

public enum BarcodeEdit {
    public static let target = Target.moduleTarget(
        name: "BarcodeEdit",
        hasResources: true,
        usesMaxSwiftVersion: false,
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeGenerator.target),
            .target(DesignSystem.target),
            .target(LocationEditor.target),
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
