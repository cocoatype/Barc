import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Barc",
    organizationName: "Cocoatype, LLC",
    settings: Shared.settings,
    targets: [
        // products
        App.target,
        Share.target,
        Watch.target,
        Widgets.target,
        // modules
        BarcodeGenerator.target,
        Barcodes.target,
        BarcodeDetails.target,
        BarcodeEdit.target,
        BarcodeView.target,
        DesignSystem.target,
        ErrorHandling.target,
        ImageReader.target,
        Library.target,
        Location.target,
        LocationEditor.target,
        Logging.target,
        ManualEntry.target,
        Menu.target,
        Navigation.target,
        Onboarding.target,
        Paywall.target,
        Permission.target,
        Persistence.target,
        Purchasing.target,
        Root.target,
        Scanner.target,
        ShareContents.target,
        Shortcuts.target,
        Triggers.target,
        WatchContents.target,
        WidgetContents.target,
        // doubles
        ErrorHandling.doublesTarget,
        Logging.doublesTarget,
        Permission.doublesTarget,
        // test helpers
        TestHelpers.target,
        TestHelpers.interfaceTarget,
        // tests
        BarcodeGenerator.testTarget,
        Barcodes.testTarget,
        ErrorHandling.testTarget,
        ImageReader.testTarget,
        Library.testTarget,
        Logging.testTarget,
        Navigation.testTarget,
        Paywall.testTarget,
        Permission.testTarget,
        Purchasing.testTarget,
        Root.testTarget,
        Scanner.testTarget,
        Shortcuts.testTarget,
        Triggers.testTarget,
        WidgetContents.testTarget,
    ],
    schemes: [
        .scheme(
            name: "Barc",
            buildAction: .buildAction(targets: [
                .target(App.target.name),
            ]),
            testAction: .testPlans([
                "Barc.xctestplan",
            ]),
            runAction: .runAction(
                arguments: .arguments(
                    environmentVariables: [
                        :
                    ],
                    launchArguments: [
                    ]
                ),
                options: .options(
                    storeKitConfigurationPath: "App/Mobile/StoreKit.storekit"
                )
            )
        ),
    ],
    fileHeaderTemplate: "  Created by ___FULLUSERNAME___ on ___DATE___.\n//  ___COPYRIGHT___"
)
