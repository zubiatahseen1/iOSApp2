//
//  HomeView.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import SwiftUI

struct HomeView: View {
    @Environment(HuntManager.self) var huntManager

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {

                // App icon / hero image
                Image("app-hero")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)

                Text("Toronto Scavenger Hunt")
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)

                Text("Find 10 hidden items across the city and earn discounts, prizes, and bragging rights.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Navigate to the item list
                NavigationLink(destination: ItemListView()) {
                    Text(huntManager.huntStarted ? "Continue Hunt" : "Start Hunt")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal)
                .simultaneousGesture(TapGesture().onEnded {
                    huntManager.huntStarted = true
                })
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
        .environment(HuntManager())
}
