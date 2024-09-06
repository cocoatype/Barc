import ProjectDescription

public enum DesignSystem {
    public static let target = Target.moduleTarget(
        name: "DesignSystem",
        destinations: [.iPhone, .appleWatch],
        hasResources: true,
        dependencies: [
        ]
    )
}
