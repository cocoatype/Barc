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
        LocationEditor.target,
        Logging.target,
        ManualEntry.target,
        Navigation.target,
        Persistence.target,
        Root.target,
        Scanner.target,
        Shortcuts.target,
        WidgetContents.target,
        // doubles
        ErrorHandling.doublesTarget,
        Logging.doublesTarget,
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
        Root.testTarget,
        Scanner.testTarget,
        Shortcuts.testTarget,
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
                )
            )
        ),
    ],
    fileHeaderTemplate: "  Created by ___FULLUSERNAME___ on ___DATE___.\n//  ___COPYRIGHT___"
)
