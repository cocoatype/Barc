import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Barc",
    organizationName: "Cocoatype, LLC",
    settings: Shared.settings,
    targets: [
        // products
        App.target,
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
        ManualEntry.target,
        Navigation.target,
        Persistence.target,
        Root.target,
        Scanner.target,
        // doubles
        // test helpers
        // tests
        BarcodeGenerator.testTarget,
        Barcodes.testTarget,
        ErrorHandling.testTarget,
        ImageReader.testTarget,
        Library.testTarget,
        Navigation.testTarget,
        Root.testTarget,
        Scanner.testTarget,
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
    ]
)
