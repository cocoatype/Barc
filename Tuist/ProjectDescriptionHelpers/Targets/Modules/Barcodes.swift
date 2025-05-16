import ProjectDescription

public enum Barcodes {
    public static let target = Target.moduleTarget(
        name: "Barcodes",
        destinations: [.iPhone, .appleWatch, .mac],
        hasResources: true,
        dependencies: [
            .external(name: "FactoryKit"),
            .external(name: "PDF417"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Barcodes",
        dependencies: [
        ]
    )
}
