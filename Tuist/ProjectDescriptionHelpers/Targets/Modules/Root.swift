import ProjectDescription

public enum Root {
    public static let target = Target.moduleTarget(
        name: "Root",
        hasResources: true,
        dependencies: [
            .target(Barcodes.target),
            .target(BarcodeDetails.target),
            .target(Defaults.target),
            .target(ErrorHandling.target),
            .target(Library.target),
            .target(LocationEditor.target),
            .target(Logging.target),
            .target(ManualEntry.target),
            .target(Menu.target),
            .target(Onboarding.target),
            .target(Paywall.target),
            .target(Persistence.target),
            .target(PhotoLibrary.target),
            .target(Purchasing.target),
            .target(Releases.target),
            .target(Routing.target),
            .target(Scanner.target),
            .target(TestHelpers.interfaceTarget),
            .target(Unpurchased.target),
            .target(Web.target),
            .external(name: "FactoryKit"),
        ]
    )

    public static let testTarget = Target.moduleTestTarget(
        name: "Root",
        dependencies: [
            .target(Defaults.doublesTarget),
            .target(ErrorHandling.doublesTarget),
            .target(Persistence.doublesTarget),
            .target(Releases.doublesTarget),
            .external(name: "FactoryKit"),
            .external(name: "FactoryTesting"),
            .external(name: "ViewInspector"),
        ]
    )
}
