//
//  PaywallViewDisplayData.swift
//  Paywall
//
//  Created by Farid Dahiri on 06.09.2024.
//

import Foundation

public struct PaywallViewDisplayData {
    public init(
        iconName: String,
        title: String,
        features: [String],
        plans: [SubscriptionPlanDisplayData],
        selectedPlan: SubscriptionPlanDisplayData,
        actionTitle: String
    ) {
        self.iconName = iconName
        self.title = title
        self.features = features
        self.plans = plans
        self.selectedPlan = selectedPlan
        self.actionTitle = actionTitle
    }
    let iconName: String
    let title: String
    let features: [String]
    let plans: [SubscriptionPlanDisplayData]
    var selectedPlan: SubscriptionPlanDisplayData
    let actionTitle: String
}

public extension PaywallViewDisplayData {
    static func dummyDisplayData() -> PaywallViewDisplayData {
        let yearlyPlan = SubscriptionPlanDisplayData(
            name: "Annually",
            price: "48.50",
            details: "Billed anually",
            billingRecurrence: "Billed yearly",
            discount: "60%"
        )
        let monthlyPlan = SubscriptionPlanDisplayData(
            name: "Monthly",
            price: "3.99",
            details: "Billed monthly",
            billingRecurrence: "Billed monthly"
        )
        return PaywallViewDisplayData(
            iconName: "smartCHECK_icon",
            title: "smartCHECKPro",
            features: [
                "SNS notification system",
                "Logbook",
                "Altitude minimums",
                "Flight simulation"
            ],
            plans: [
                yearlyPlan,
                monthlyPlan
            ],
            selectedPlan: yearlyPlan,
            actionTitle: "Subscribe"
        )
    }
}

