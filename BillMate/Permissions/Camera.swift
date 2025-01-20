//
//  Camera.swift
//  BillMate
//
//  Created by william wu on 1/18/25.
//
import SwiftUI
import AVFoundation
import UIKit

@MainActor
class CameraPermission: ObservableObject {
    @Published var isCameraPermission: Bool = false
    @Published var showCamera: Bool = false

    func getCameraPermission() async {
        let status = AVCaptureDevice.authorizationStatus(for: .video)

        switch status {
        case .authorized:
            isCameraPermission = true
        case .notDetermined:
            let granted = await AVCaptureDevice.requestAccess(for: .video)
            isCameraPermission = granted
        case .denied, .restricted:
            isCameraPermission = false
        @unknown default:
            isCameraPermission = false
        }

        if isCameraPermission {
            showCamera = true
        }
    }
}

struct CameraView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    @Binding var capturedImage: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CameraView

        init(_ parent: CameraView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.capturedImage = image
            }
            parent.isPresented = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isPresented = false
        }
    }
}
