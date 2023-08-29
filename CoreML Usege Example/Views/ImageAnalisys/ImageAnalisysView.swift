//
//  ImageAnalisysView.swift
//  CoreML Usege Example
//
//  Created by Stanislav Seryogin on 29.08.2023.
//

import SwiftUI

struct ImageAnalysisView: View {
    @ObservedObject var viewModel: ImageAnalysisViewModel = ImageAnalysisViewModel()
    
    var body: some View {
        VStack {
            Image(uiImage: viewModel.selectedImage ?? UIImage())
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity)
            
            Spacer()
            
            HStack {
                Button(action: {
                    viewModel.showPhotoPickerOptions()
                }) {
                    Image(systemName: "camera")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding(.leading, 40)
                }
                Spacer()
            }
        }
        .sheet(isPresented: $viewModel.isImagePickerPresented) {
            ImagePicker(sourceType: self.viewModel.sourceType,
                        selectedImage: self.$viewModel.selectedImage,
                        isPresented: self.$viewModel.isImagePickerPresented)
        }
    }
}

struct ImageAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        ImageAnalysisView()
    }
}
