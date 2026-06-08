//
//  ItemDetailView.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-08.
//

import SwiftUI

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

                    // Photo preview or placeholder
                    if let photo = capturedPhoto {
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

                    // Clue
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Your Clue")
                            .font(.headline)
                        Text(item.clue)
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }

                    // Business info
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Location")
                            .font(.headline)
                        Text(item.businessName)
                            .font(.body)
                        Text(item.address)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                    // Camera button
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
                    .disabled(false)
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
            // TODO: Replace with real camera sheet using UIImagePickerController
            .sheet(isPresented: $showCamera) {
                Text("Camera goes here")  // placeholder
            }
            .onChange(of: capturedPhoto) { photo in
                if let photo = photo {
                    huntManager.markFound(id: item.id, photo: photo)
                }
            }
        }
    }
}
