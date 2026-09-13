import ProjectDescription

public enum Location {
    public static let target = Target.moduleTarget(
        name: "Location",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Location",
        dependencies: [
        ]
    )
}
