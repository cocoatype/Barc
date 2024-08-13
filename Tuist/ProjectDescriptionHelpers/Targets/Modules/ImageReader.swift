import ProjectDescription

public enum ImageReader {
    public static let target = Target.moduleTarget(
        name: "ImageReader",
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ImageReader",
        dependencies: [
        ]
    )
}
