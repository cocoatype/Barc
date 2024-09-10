import ProjectDescription

public enum Triggers {
    public static let target = Target.moduleTarget(
        name: "Triggers",
        dependencies: [
            .target(Barcodes.target),
            .target(Location.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Triggers",
        dependencies: [
        ]
    )
}
