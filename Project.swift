import ProjectDescription

let project = Project(
  name: "Barc",
  organizationName: "Cocoatype, LLC",
  targets: [
    Target(
      name: "BarcAppMobile",
      platform: .iOS,
      product: .app,
      bundleId: "com.cocoatype.Barc",
      infoPlist: .extendingDefault(with: [
        "UILaunchStoryboardName": "LaunchScreen.storyboard",
      ]),
      sources: [
        "App/Mobile/Sources/**",
      ],
      resources: [
        "App/Mobile/Resources/**",
      ]
    ),
  ]
)
