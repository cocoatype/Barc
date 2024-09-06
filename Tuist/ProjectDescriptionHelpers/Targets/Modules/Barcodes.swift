import ProjectDescription

public enum Barcodes {
    public static let target = Target.moduleTarget(
        name: "Barcodes",
        destinations: [.iPhone, .appleWatch],
        usesMaxSwiftVersion: true,
        dependencies: [
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Barcodes",
        dependencies: [
        ]
    )
}
