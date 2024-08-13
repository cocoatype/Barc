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
        Barcodes.target,
        BarcodeGenerator.target,
        ErrorHandling.target,
        ImageReader.target,
        Library.target,
        ManualEntry.target,
        Persistence.target,
        // doubles
        // test helpers
        // tests
        Barcodes.testTarget,
        BarcodeGenerator.testTarget,
        ErrorHandling.testTarget,
        ImageReader.testTarget,
        Library.testTarget,
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
