@testable import SwiftLintBuiltInRules

final class ImplicitReturnRuleTests: SwiftLintTestCase {
    func testOnlyClosureKindIncluded() async {
        var nonTriggeringExamples = ImplicitReturnRuleExamples.nonTriggeringExamples +
                                    ImplicitReturnRuleExamples.triggeringExamples
        nonTriggeringExamples.removeAll(
            where: ImplicitReturnRuleExamples.ClosureExamples.triggeringExamples.contains
        )

        await verifySubset(
            nonTriggeringExamples: nonTriggeringExamples,
            triggeringExamples: ImplicitReturnRuleExamples.ClosureExamples.triggeringExamples,
            corrections: ImplicitReturnRuleExamples.ClosureExamples.corrections,
            kind: .closure
        )
    }

    func testOnlyFunctionKindIncluded() async {
        var nonTriggeringExamples = ImplicitReturnRuleExamples.nonTriggeringExamples +
                                    ImplicitReturnRuleExamples.triggeringExamples
        nonTriggeringExamples.removeAll(
            where: ImplicitReturnRuleExamples.FunctionExamples.triggeringExamples.contains
        )

        await verifySubset(
            nonTriggeringExamples: nonTriggeringExamples,
            triggeringExamples: ImplicitReturnRuleExamples.FunctionExamples.triggeringExamples,
            corrections: ImplicitReturnRuleExamples.FunctionExamples.corrections,
            kind: .function
        )
    }

    func testOnlyGetterKindIncluded() async {
        var nonTriggeringExamples = ImplicitReturnRuleExamples.nonTriggeringExamples +
                                    ImplicitReturnRuleExamples.triggeringExamples
        nonTriggeringExamples.removeAll(
            where: ImplicitReturnRuleExamples.GetterExamples.triggeringExamples.contains
        )

        await verifySubset(
            nonTriggeringExamples: nonTriggeringExamples,
            triggeringExamples: ImplicitReturnRuleExamples.GetterExamples.triggeringExamples,
            corrections: ImplicitReturnRuleExamples.GetterExamples.corrections,
            kind: .getter
        )
    }

    func testOnlyInitializerKindIncluded() async {
        var nonTriggeringExamples = ImplicitReturnRuleExamples.nonTriggeringExamples +
                                    ImplicitReturnRuleExamples.triggeringExamples
        nonTriggeringExamples.removeAll(
            where: ImplicitReturnRuleExamples.InitializerExamples.triggeringExamples.contains
        )

        await verifySubset(
            nonTriggeringExamples: nonTriggeringExamples,
            triggeringExamples: ImplicitReturnRuleExamples.InitializerExamples.triggeringExamples,
            corrections: ImplicitReturnRuleExamples.InitializerExamples.corrections,
            kind: .initializer
        )
    }

    func testOnlySubscriptKindIncluded() async {
        var nonTriggeringExamples = ImplicitReturnRuleExamples.nonTriggeringExamples +
                                    ImplicitReturnRuleExamples.triggeringExamples
        nonTriggeringExamples.removeAll(
            where: ImplicitReturnRuleExamples.SubscriptExamples.triggeringExamples.contains
        )

        await verifySubset(
            nonTriggeringExamples: nonTriggeringExamples,
            triggeringExamples: ImplicitReturnRuleExamples.SubscriptExamples.triggeringExamples,
            corrections: ImplicitReturnRuleExamples.SubscriptExamples.corrections,
            kind: .subscript
        )
    }

    private func verifySubset(
        nonTriggeringExamples: [Example],
        triggeringExamples: [Example],
        corrections: [Example: Example],
        kind: ImplicitReturnConfiguration.ReturnKind
    ) async {
        let description = ImplicitReturnRule.description
            .with(nonTriggeringExamples: nonTriggeringExamples.removingViolationMarker())
            .with(triggeringExamples: triggeringExamples)
            .with(corrections: corrections)

        await self.verifyRule(description, ruleConfiguration: ["included": [kind.rawValue]])
    }
}
