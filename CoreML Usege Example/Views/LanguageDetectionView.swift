//
//  File.swift
//  
//
//  Created by Stanislav Seryogin on 28.08.2023.
//

import SwiftUI
import NaturalLanguage

struct LanguageDetectionView: View {
    @State private var inputText: String = ""
    @State private var detectedLanguage: String = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter text", text: $inputText, onCommit: detectLanguage)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: detectLanguage) {
                Text("Detect Language")
            }
            .padding()

            Text("Detected Language: \(detectedLanguage)")
        }
        .padding()
        .navigationTitle("Language Detection")
    }

    func detectLanguage() {
        if let language = NLLanguageRecognizer.dominantLanguage(for: inputText) {
            detectedLanguage = language.rawValue.uppercased()
        } else {
            detectedLanguage = "Unknown"
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
