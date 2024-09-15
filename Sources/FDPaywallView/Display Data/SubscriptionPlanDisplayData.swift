//
//  SubscriptionPlanDisplayData.swift
//  Paywall
//
//  Created by Farid on 15.09.2024.
//

import Foundation

public struct SubscriptionPlanDisplayData: Hashable {
    public init(
        name: String,
        price: String,
        details: String,
        billingRecurrence: String,
        discount: String? = nil
    ) {
        self.name = name
        self.price = price
        self.details = details
        self.billingRecurrence = billingRecurrence
        self.discount = discount
    }
    let name: String
    let price: String
    let details: String
    let billingRecurrence: String
    let discount: String?
}
