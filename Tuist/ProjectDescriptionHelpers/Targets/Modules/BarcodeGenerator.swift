import ProjectDescription

public enum BarcodeGenerator {
    public static let target = Target.moduleTarget(
        name: "BarcodeGenerator",
        dependencies: [
            .target(ErrorHandling.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "BarcodeGenerator",
        dependencies: [
        ]
    )
}
