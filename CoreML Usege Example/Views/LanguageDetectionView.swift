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
    @State private var words: [String] = []

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter text", text: $inputText, onCommit: detectLanguage)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            MainAppButton(title: "Detected Language")
                            .onTapGesture {
                                self.detectLanguage()
                            }

            Text("Detected Language: \(detectedLanguage)")
            
            List(words, id: \.self) { word in
                Text(word)
            }

        }
        .padding()
        .navigationTitle("Language Detection")
    }

    func detectLanguage() {
        // Identify the dominant language
        if let language = NLLanguageRecognizer.dominantLanguage(for: inputText) {
            detectedLanguage = language.rawValue.uppercased()
        } else {
            detectedLanguage = "Unknown"
        }
        
        // Process the input text with NLTagger
        let tagger = NLTagger(tagSchemes: [NLTagScheme.tokenType])
        tagger.string = inputText
        
        var extractedWords: [String] = []
        tagger.enumerateTags(in: inputText.startIndex..<inputText.endIndex,
                             unit: NLTokenUnit.word,
                             scheme: NLTagScheme.tokenType,
                             options: [.omitPunctuation, .omitWhitespace]) { (tag, range) -> Bool in
            extractedWords.append(String(inputText[range]))
            return true
        }
        words = extractedWords
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}


