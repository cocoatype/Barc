import ProjectDescription

public enum Navigation {
    public static let target = Target.moduleTarget(
        name: "Navigation",
        dependencies: [
            .target(Barcodes.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Navigation",
        dependencies: [
        ]
    )
}
