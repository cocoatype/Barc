import ProjectDescription

public enum Root {
    public static let target = Target.moduleTarget(
        name: "Root",
        dependencies: [
            .target(BarcodeDetails.target),
            .target(Library.target),
            .target(ManualEntry.target),
            .target(Navigation.target),
            .target(Scanner.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Root",
        dependencies: [
        ]
    )
}
