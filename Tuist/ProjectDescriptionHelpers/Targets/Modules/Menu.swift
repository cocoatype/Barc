import ProjectDescription

public enum Menu {
    public static let target = Target.moduleTarget(
        name: "Menu",
        hasResources: true,
        dependencies: [
            .target(Defaults.target),
            .target(Icons.target),
            .target(Onboarding.target),
            .target(Releases.target),
            .target(TestHelpers.interfaceTarget),
            .target(Web.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Menu",
        dependencies: [
            .target(Defaults.target),
            .target(Defaults.doublesTarget),
            .target(Persistence.doublesTarget),
            .target(Releases.target),
            .target(Releases.doublesTarget),
            .target(TestHelpers.interfaceTarget),
            .external(name: "FactoryKit"),
            .external(name: "FactoryTesting"),
            .external(name: "ViewInspector"),
        ]
    )
}
