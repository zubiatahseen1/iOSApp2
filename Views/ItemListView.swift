//
//  ItemListView.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import SwiftUI

/// Displays all 10 scavenger items in a two-column grid.
/// Tapping a card opens the detail sheet; the toolbar shows a running found-count
/// and a "Submit" button that opens the results screen.
struct ItemListView: View {
    @Environment(HuntManager.self) var huntManager
    @State private var selectedItem: ScavengerItem? = nil
    @State private var showResults: Bool = false

    /// Two flexible columns for the LazyVGrid layout.
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(huntManager.items) { item in
                    ItemCardView(item: item)
                        .onTapGesture {
                            selectedItem = item
                        }
                }
            }
            .padding()
        }
        .navigationTitle("The Hunt")
        .toolbar {
            // Submit button — disabled until the user has found at least one item
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Submit") {
                    showResults = true
                }
                .disabled(huntManager.foundCount == 0)
            }

            // Running progress counter
            ToolbarItem(placement: .navigationBarLeading) {
                Text("\(huntManager.foundCount)/10 Found")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        // Item detail opens as a sheet; environment must be passed explicitly to sheets
        .sheet(item: $selectedItem) { item in
            ItemDetailView(item: item)
                .environment(huntManager)
        }
        // Results screen opens as a full-screen cover
        .fullScreenCover(isPresented: $showResults) {
            ResultsView()
                .environment(huntManager)
        }
    }
}
