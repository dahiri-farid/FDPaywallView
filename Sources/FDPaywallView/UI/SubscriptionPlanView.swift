//
//  SubscriptionPlanView.swift
//  Paywall
//
//  Created by Farid Dahiri on 12.09.2024.
//

import SwiftUI

struct ColorInvert: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme

    func body(content: Content) -> some View {
        Group {
            if colorScheme == .dark {
                content.colorInvert()
            } else {
                content
            }
        }
    }
}

struct SubscriptionPlanView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let id: String
    let callback: (String)->()
    let selectedID : String
    let size: CGFloat = 20
    let color: Color = Color.primary
    let textSize: CGFloat = 20
    let subscriptionPlan: SubscriptionPlanDisplayData
    
    init(
        _ id: String,
        callback: @escaping (String)->(),
        selectedID: String,
        subscriptionPlan: SubscriptionPlanDisplayData
        ) {
        self.id = id
        self.selectedID = selectedID
        self.callback = callback
        self.subscriptionPlan = subscriptionPlan
    }
    
    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.selectedID == self.id ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                    .modifier(ColorInvert())
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text(subscriptionPlan.name)
                            .font(.headline)
                        if let discount = subscriptionPlan.discount {
                            Text(discount)
                                .padding(.all, 4)
                                .font(.footnote)
                                .background(Color.blue)
                                .cornerRadius(6.0)
                        }
                    }
                    Text(subscriptionPlan.price)
                        .font(.subheadline)
                    Text(subscriptionPlan.details)
                        .font(.footnote)
                }
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(self.color)
    }
}
