//
//  DisplayImageView.swift
//  CoreML Usege Example
//
//  Created by Stanislav Seryogin on 29.08.2023.
//

import SwiftUI

struct DisplayImageView: View {
    @Binding var selectedImage: UIImage?
    
    var body: some View {
        if let image = selectedImage {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

