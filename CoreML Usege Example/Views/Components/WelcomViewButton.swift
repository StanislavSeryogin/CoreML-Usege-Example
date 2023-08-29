//
//  WelcomViewButton.swift
//  CoreML Usege Example
//
//  Created by Stanislav Seryogin on 29.08.2023.
//

import SwiftUI

struct WelcomeViewButton: View {
    let title: String

    var body: some View {
           Text(title)
               .padding()
               .background(Color.blue)
               .foregroundColor(.white)
               .cornerRadius(8)
       }
}
