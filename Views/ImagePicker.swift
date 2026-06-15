//
//  ImagePicker.swift
//  iOSApp2
//
//  Created by Zubia Tahseen on 2026-06-14.
//

import SwiftUI

/// Wraps UIImagePickerController so the user can take a photo with the camera
/// or choose one from the photo library. Uses the photo library as a fallback
/// when running on the simulator where the camera is unavailable.
struct ImagePicker: UIViewControllerRepresentable {
    /// The image selected or captured by the user, passed back via a binding.
    @Binding var image: UIImage?

    /// Dismisses the picker after a photo is selected or the user taps cancel.
    @Environment(\.dismiss) private var dismiss

    // MARK: - UIViewControllerRepresentable

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator

        // Use the camera if available (real device), otherwise fall back to photo library
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }

        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    // MARK: - Coordinator

    /// Bridges UIImagePickerControllerDelegate callbacks into SwiftUI.
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        /// Called when the user selects or captures a photo.
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
        ) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            parent.dismiss()
        }

        /// Called when the user taps cancel without selecting a photo.
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}
