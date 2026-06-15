//
//  ItemDetailView.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import SwiftUI

/// Detail view for a single scavenger item, presented as a sheet from ItemListView.
/// Shows the item's clue, location info, and a photo preview. The user can take
/// a photo using the ImagePicker (camera on device, photo library on simulator)
/// to mark the item as found.
struct ItemDetailView: View {
    let item: ScavengerItem
    @Environment(HuntManager.self) var huntManager
    @Environment(\.dismiss) var dismiss
    @State private var showCamera: Bool = false
    @State private var capturedPhoto: UIImage? = nil

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // Photo preview: shows the captured image or a camera placeholder
                    if let photo = capturedPhoto ?? item.photo {
                        Image(uiImage: photo)
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } else {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemGray5))
                            .frame(height: 200)
                            .overlay(
                                Image(systemName: "camera.fill")
                                    .font(.system(size: 40))
                                    .foregroundStyle(.secondary)
                            )
                    }

                    // Clue section — the riddle the user solves to find the item
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Your Clue")
                            .font(.headline)
                        Text(item.clue)
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }

                    // Location details — reveals which business to visit
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Location")
                            .font(.headline)
                        Text(item.businessName)
                            .font(.body)
                        Text(item.address)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                    // Camera button to capture proof of finding the item
                    Button {
                        showCamera = true
                    } label: {
                        Label(
                            item.isFound ? "Retake Photo" : "Take Photo to Mark Found",
                            systemImage: "camera"
                        )
                        .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
                .padding()
            }
            .navigationTitle(item.itemName)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
            // Present the ImagePicker (camera or photo library) as a sheet
            .sheet(isPresented: $showCamera) {
                ImagePicker(image: $capturedPhoto)
            }
            // When a photo is captured, mark the item as found in HuntManager
            .onChange(of: capturedPhoto) { oldValue, newValue in
                if let photo = newValue {
                    huntManager.markFound(id: item.id, photo: photo)
                }
            }
        }
    }
}
