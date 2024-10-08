import ProjectDescription

public enum ImageReader {
    public static let target = Target.moduleTarget(
        name: "ImageReader",
        destinations: [.iPhone, .mac],
        usesMaxSwiftVersion: true,
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ImageReader",
        hasResources: true,
        dependencies: [
        ]
    )
}
