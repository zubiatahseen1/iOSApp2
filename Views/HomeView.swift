//
//  HomeView.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import SwiftUI

/// The landing screen for the Toronto Scavenger Hunt app.
/// Displays a hero graphic, a brief description of the game, and a button
/// to start or continue the hunt. Uses NavigationStack to push to ItemListView.
struct HomeView: View {
    @Environment(HuntManager.self) var huntManager

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {

                // Hero image using an SF Symbol as a visual centerpiece
                Image(systemName: "map.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .foregroundStyle(.tint)
                    .padding(.top, 40)

                Text("Toronto Scavenger Hunt")
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)

                Text("Find 10 hidden items across the city and earn discounts, prizes, and bragging rights.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Spacer()

                // Primary call-to-action: navigates to the item grid
                NavigationLink(destination: ItemListView()) {
                    Text(huntManager.huntStarted ? "Continue Hunt" : "Start Hunt")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
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
