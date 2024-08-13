import ProjectDescription

public enum Persistence {
    public static let target = Target.moduleTarget(
        name: "Persistence",
        dependencies: [
            .target(Barcodes.target),
            .target(ErrorHandling.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Persistence",
        dependencies: [
        ]
    )
}
