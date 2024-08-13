import ProjectDescription

public enum Barcodes {
    public static let target = Target.moduleTarget(
        name: "Barcodes",
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
