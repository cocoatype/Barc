import ProjectDescription

public enum Library {
    public static let target = Target.moduleTarget(
        name: "Library",
        dependencies: [
            .target(BarcodeGenerator.target),
            .target(Persistence.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Library",
        dependencies: [
        ]
    )
}
