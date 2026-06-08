//
//  ItemListView.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import SwiftUI

struct ItemListView: View {
    @Environment(HuntManager.self) var huntManager
    @State private var selectedItem: ScavengerItem? = nil
    @State private var showResults: Bool = false

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
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Submit") {
                    showResults = true
                }
                .disabled(huntManager.foundCount == 0)
            }

            ToolbarItem(placement: .navigationBarLeading) {
                Text("\(huntManager.foundCount)/10 Found")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        // Item detail opens as a sheet
        .sheet(item: $selectedItem) { item in
            ItemDetailView(item: item)
        }
        // Results opens as a full screen cover
        .fullScreenCover(isPresented: $showResults) {
            ResultsView()
        }
    }
}
