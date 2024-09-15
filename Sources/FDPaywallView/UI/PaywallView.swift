//
//  PaywallView.swift
//  Paywall
//
//  Created by Farid Dahiri on 06.09.2024.
//

import SwiftUI

public protocol PaywallViewModelDelegate: AnyObject {
    func subscribe(plan: SubscriptionPlanDisplayData) async
}

public struct PaywallView: View {
    weak var delegate: PaywallViewModelDelegate?
    
    @State private var displayData: PaywallViewDisplayData
    
    public init(displayData: PaywallViewDisplayData) {
        self.displayData = displayData
    }
    
    public var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            Image(displayData.iconName)
                .resizable()
                .frame(width: 100, height: 100)
        }
        Text(displayData.title)
            .font(.largeTitle)
        List {
            Section {
                ForEach(displayData.features, id: \.self) { feature in
                    HStack {
                        Image(systemName: "checkmark.circle")
                        Text(feature)
                    }
                }
            }
            Section {
                ForEach(displayData.plans, id: \.self) { plan in
                    SubscriptionPlanView(
                        plan.name,
                        callback: { string in
                            displayData.selectedPlan = plan
                        },
                        selectedID: displayData.selectedPlan.name,
                        subscriptionPlan: plan
                    )
                }
            }
        }
        Button {
            Task {
                await delegate?.subscribe(plan: displayData.selectedPlan)
            }
        } label: {
            Text(displayData.actionTitle)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .tint(.blue)
        .padding()
    }
}

#Preview {
    PaywallView(displayData: .dummyDisplayData())
}
