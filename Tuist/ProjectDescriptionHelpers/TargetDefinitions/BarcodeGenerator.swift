import ProjectDescription

public enum BarcodeGenerator {
    public static let target = Target(
        name: "BarcodeGenerator",
        platform: .iOS,
        product: .framework,
        bundleId: "com.cocoatype.Barc.BarcodeGenerator",
        sources: [
            "BarcodeGenerator/Sources/**",
        ],
        dependencies: [
            .target(ErrorHandling.target),
        ]
    )

    public static let testTarget = Target(
        name: "BarcodeGeneratorTests",
        platform: .iOS,
        product: .unitTests,
        bundleId: "com.cocoatype.Barc.BarcodeGeneratorTests",
        sources: [
            "BarcodeGenerator/Tests/Sources/**",
        ],
        dependencies: [
            .target(target),
        ]
    )
}
