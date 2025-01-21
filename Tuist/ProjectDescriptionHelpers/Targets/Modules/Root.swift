import ProjectDescription

public enum Root {
    public static let target = Target.moduleTarget(
        name: "Root",
        dependencies: [
            .target(BarcodeDetails.target),
            .target(Defaults.target),
            .target(Library.target),
            .target(ManualEntry.target),
            .target(Menu.target),
            .target(Navigation.target),
            .target(Onboarding.target),
            .target(Purchasing.target),
            .target(Releases.target),
            .target(Scanner.target),
            .target(TestHelpers.interfaceTarget),
            .target(Unpurchased.target),
            .target(Web.target),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Root",
        dependencies: [
            .target(Defaults.doublesTarget),
            .target(Persistence.doublesTarget),
            .target(Releases.doublesTarget),
            .external(name: "ViewInspector"),
        ]
    )
}
