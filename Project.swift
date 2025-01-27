import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Barc",
    organizationName: "Cocoatype, LLC",
    settings: Shared.settings,
    targets: [
        // products
        App.target,
        CodeScanner.target,
        Share.target,
        Watch.target,
        Widgets.target,
        // modules
        AppShortcuts.target,
        BarcodeGenerator.target,
        Barcodes.target,
        BarcodeDetails.target,
        BarcodeEdit.target,
        BarcodeView.target,
        Defaults.target,
        DesignSystem.target,
        ErrorHandling.target,
        ImageReader.target,
        Library.target,
        Location.target,
        LocationEditor.target,
        Logging.target,
        ManualEntry.target,
        Menu.target,
        Onboarding.target,
        Paywall.target,
        Permission.target,
        Persistence.target,
        Purchasing.target,
        Releases.target,
        ReviewRequest.target,
        Root.target,
        Routing.target,
        Scanner.target,
        ShareContents.target,
        ShortcutsModels.target,
        Triggers.target,
        Unpurchased.target,
        WalletExport.target,
        WatchContents.target,
        Web.target,
        WidgetContents.target,
        WidgetShortcuts.target,
        // doubles
        Defaults.doublesTarget,
        ErrorHandling.doublesTarget,
        Logging.doublesTarget,
        Permission.doublesTarget,
        Persistence.doublesTarget,
        Purchasing.doublesTarget,
        Releases.doublesTarget,
        // test helpers
        TestHelpers.target,
        TestHelpers.interfaceTarget,
        // tests
        AppShortcuts.testTarget,
        BarcodeGenerator.testTarget,
        Barcodes.testTarget,
        Defaults.testTarget,
        ErrorHandling.testTarget,
        ImageReader.testTarget,
        Library.testTarget,
        Logging.testTarget,
        Menu.testTarget,
        Onboarding.testTarget,
        Paywall.testTarget,
        Permission.testTarget,
        Purchasing.testTarget,
        Releases.testTarget,
        ReviewRequest.testTarget,
        Root.testTarget,
        Routing.testTarget,
        Scanner.testTarget,
        ShareContents.testTarget,
        ShortcutsModels.testTarget,
        Triggers.testTarget,
        Unpurchased.testTarget,
        WalletExport.testTarget,
        WidgetContents.testTarget,
        WidgetShortcuts.testTarget,
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
                        .launchArgument(name: "-com.apple.CoreData.SQLDebug 0", isEnabled: true),
                        .launchArgument(name: "-com.apple.CoreData.CloudKitDebug 0", isEnabled: true),
                        .launchArgument(name: "-com.apple.CoreData.Logging.stderr 0", isEnabled: true),
                        .launchArgument(name: "-com.apple.CoreData.ConcurrencyDebug 0", isEnabled: true),
                        .launchArgument(name: "-com.apple.CoreData.MigrationDebug 0", isEnabled: true),
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
