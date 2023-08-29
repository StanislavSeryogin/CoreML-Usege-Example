//
//  LanguageDetectionViewModel.swift
//  CoreML Usege Example
//
//  Created by Stanislav Seryogin on 29.08.2023.
//

import NaturalLanguage

class LanguageDetectionViewModel: ObservableObject {
    @Published var inputText: String = ""
    @Published var detectedLanguage: String = ""
    @Published var words: [String] = []
    
    func detectLanguage() {
        if let language = NLLanguageRecognizer.dominantLanguage(for: inputText) {
            detectedLanguage = language.rawValue.uppercased()
        } else {
            detectedLanguage = "Unknown"
        }
        
        let tagger = NLTagger(tagSchemes: [NLTagScheme.tokenType])
        tagger.string = inputText
        
        var extractedWords: [String] = []
        tagger.enumerateTags(in: inputText.startIndex..<inputText.endIndex,
                             unit: NLTokenUnit.word,
                             scheme: NLTagScheme.tokenType,
                             options: [.omitPunctuation, .omitWhitespace]) { (tag, range) -> Bool in
            extractedWords.append(String(self.inputText[range]))
            return true
        }
        words = extractedWords
    }
}
