//
//  CameraView.swift
//  BillMate
//
//  Created by william wu on 1/18/25.
//

import SwiftUI

struct BillPhotoView: View {
    @StateObject private var cameraPermission = CameraPermission()
    @State private var capturedImage: UIImage?
    @State var isManual: Bool = false
    
    var body: some View {
        VStack {
            Text("Take a photo of your receipt!")
                .padding()
                .font(.title)
            Button("Request Camera Permission") {
                Task {
                    await cameraPermission.getCameraPermission()
                }
            }
            .fontWeight(.heavy)
            .font(.title3)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)

            if let image = capturedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            
            NavigationLink(destination: BillView()) {
                Text("Enter Receipt Manually")
            }
            .fontWeight(.heavy)
            .font(.title3)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
        }
        .sheet(isPresented: $cameraPermission.showCamera) {
            CameraView(isPresented: $cameraPermission.showCamera, capturedImage: $capturedImage)
        }
    }
}

struct BillPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        BillPhotoView()
            .previewDevice("iPhone 16 Pro")
    }
}
