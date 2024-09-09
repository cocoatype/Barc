import ProjectDescription

public enum Purchasing {
    public static let target = Target.moduleTarget(
        name: "Purchasing",
        dependencies: [
            .external(name: "RevenueCat"),
            .external(name: "RevenueCatUI"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Purchasing",
        dependencies: [
        ]
    )
}
