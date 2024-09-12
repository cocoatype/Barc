import ProjectDescription

public enum ReviewRequest {
    public static let target = Target.moduleTarget(
        name: "ReviewRequest",
        dependencies: [
            .target(ErrorHandling.target),
            .target(Persistence.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "ReviewRequest",
        dependencies: [
            .target(Persistence.doublesTarget),
            .target(TestHelpers.target),
        ]
    )
}
