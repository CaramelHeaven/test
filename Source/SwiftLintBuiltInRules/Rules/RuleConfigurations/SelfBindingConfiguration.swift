import SwiftLintCore

@AutoApply
struct SelfBindingConfiguration: SeverityBasedRuleConfiguration, Equatable {
    typealias Parent = SelfBindingRule

    @ConfigurationElement(key: "severity")
    private(set) var severityConfiguration = SeverityConfiguration<Parent>(.warning)
    @ConfigurationElement(key: "bind_identifier")
    private(set) var bindIdentifier = "self"
}
