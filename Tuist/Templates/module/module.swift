import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
    description: "New Module Template",
    attributes: [
        nameAttribute,
    ],
    items: [
        .string(
            path: "Modules/\(nameAttribute)/Sources/\(nameAttribute).swift",
            contents: "import Foundation"
        ),
        .file(
            path: "Tuist/ProjectDescriptionHelpers/Targets/Modules/\(nameAttribute).swift",
            templatePath: "target.stencil"
        ),
    ]
)
