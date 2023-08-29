//
//  CameraButton.swift
//  CoreML Usege Example
//
//  Created by Stanislav Seryogin on 29.08.2023.
//

import SwiftUI

struct CameraButton: View {
    var body: some View {
        Button(action: {}) { // Empty action; real action is in ContentView's onTapGesture.
            Image(systemName: "camera")
        }
        .padding()
    }
}
