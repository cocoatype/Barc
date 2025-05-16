import ProjectDescription

public enum ReviewRequest {
    public static let target = Target.moduleTarget(
        name: "ReviewRequest",
        dependencies: [
            .target(ErrorHandling.target),
            .target(Persistence.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ReviewRequest",
        dependencies: [
            .target(Barcodes.target),
            .target(Persistence.doublesTarget),
            .target(TestHelpers.interfaceTarget),
        ]
    )
}
