//
//  File.swift
//  
//
//  Created by Stanislav Seryogin on 28.08.2023.
//

import SwiftUI
import NaturalLanguage

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: LanguageDetectionView()) {
                    MainAppButton(title: "Go to Language Detection")
                }
            }
            .padding()
            .navigationTitle("Welcome")
        }
    }
}
