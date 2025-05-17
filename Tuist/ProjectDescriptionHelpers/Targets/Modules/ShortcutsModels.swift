import ProjectDescription

public enum ShortcutsModels {
    public static let target = Target.moduleTarget(
        name: "ShortcutsModels",
        destinations: [.iPhone, .appleWatch],
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeGenerator.target),
            .target(ErrorHandling.target),
            .target(Persistence.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ShortcutsModels",
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.doublesTarget),
            .external(name: "FactoryKit"),
            .external(name: "FactoryTesting"),
        ]
    )
}
