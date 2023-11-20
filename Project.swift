import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "Barc",
  organizationName: "Cocoatype, LLC",
  targets: [
    AppMobile.target,
    BarcodeGenerator.target,
    BarcodeGenerator.testTarget,
    ErrorHandling.target,
    ErrorHandling.testTarget,
  ],
  fileHeaderTemplate: .string("""
    Created by ___FULLUSERNAME___ on ___DATE___.
  //  ___COPYRIGHT___
  """)
)
