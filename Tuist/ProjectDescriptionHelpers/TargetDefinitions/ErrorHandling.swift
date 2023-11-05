import ProjectDescription

public enum ErrorHandling {
    public static let target = Target(
        name: "ErrorHandling",
        platform: .iOS,
        product: .framework,
        bundleId: "com.cocoatype.Barc.ErrorHandling",
        sources: [
            "ErrorHandling/Sources/**",
        ]
    )

    public static let testTarget = Target(
        name: "ErrorHandlingTests",
        platform: .iOS,
        product: .unitTests,
        bundleId: "com.cocoatype.Barc.ErrorHandlingTests",
        sources: [
            "ErrorHandling/Tests/Sources/**",
        ],
        dependencies: [
            .target(target),
        ]
    )
}
