import ProjectDescription

public enum Location {
    public static let target = Target.moduleTarget(
        name: "Location",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Location",
        dependencies: [
        ]
    )
}
