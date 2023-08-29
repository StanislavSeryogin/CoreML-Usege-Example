//
//  ImageAnalisysViewModel.swift
//  CoreML Usege Example
//
//  Created by Stanislav Seryogin on 29.08.2023.
//

import SwiftUI
import Combine

class ImageAnalysisViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    @Published var isImagePickerPresented: Bool = false
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func showPhotoPickerOptions() {
        let photoSourcePicker = UIAlertController()
        
        let takePhoto = UIAlertAction(title: "Take Photo", style: .default) { [weak self] _ in
            self?.sourceType = .camera
            self?.isImagePickerPresented = true
        }
        
        let choosePhoto = UIAlertAction(title: "Choose Photo", style: .default) { [weak self] _ in
            self?.sourceType = .photoLibrary
            self?.isImagePickerPresented = true
        }
        
        photoSourcePicker.addAction(takePhoto)
        photoSourcePicker.addAction(choosePhoto)
        photoSourcePicker.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let topViewController = windowScene.windows.first?.rootViewController {
            topViewController.present(photoSourcePicker, animated: true)
        }
    }
}


