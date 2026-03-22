//
//  ContentView.swift
//  WordScramble(part_three)
//
//  Created by Amanzhol on 22.03.2026.
//

import SwiftUI
import UIKit

struct ContentView: View {
   
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
   
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
   
    var score: Int {
        usedWords.reduce(0) { partialResult, word in
            partialResult + word.count
        }
    }
   
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [.indigo.opacity(0.9), .blue.opacity(0.75), .purple.opacity(0.9)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
               
                VStack(spacing: 20) {
                    Text("🧩 Word Scramble")
                        .gameTitleStyle()
                   
                    VStack(spacing: 10) {
                        Text("🎯 Root word")
                            .sectionLabelStyle()
                       
                        Text(rootWord)
                            .font(.largeTitle.bold())
                            .foregroundStyle(.white)
                    }
                    .gameCardStyle()
                   
                    VStack(spacing: 10) {
                        Text("⭐ Score: \(score)")
                            .scoreTextStyle()
                       
                        Text("📝 Words found: \(usedWords.count)")
                            .infoTextStyle()
                    }
                    .gameCardStyle()
                   
                    List {
                        Section {
                            TextField("⌨️ Enter your word", text: $newWord)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                        } header: {
                            Text("✍️ Enter answer")
                                .foregroundStyle(.white)
                        }
                       
                        Section {
                            ForEach(usedWords, id: \.self) { word in
                                WordRow(word: word)
                                    .listRowBackground(Color.white.opacity(0.10))
                            }
                        } header: {
                            Text("✅ Used words")
                                .foregroundStyle(.white)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                }
                .padding()
            }
            .navigationTitle("Game")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("🔄 Restart") {
                    startGame()
                }
                .foregroundStyle(.white)
            }
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK") { }
            } message: {
                Text(errorMessage)
            }
        }
        .tint(.white)
    }
   
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
       
        guard answer.isEmpty == false else { return }
       
        guard isLongEnough(word: answer) else {
            wordError(
                title: "Word too short",
                message: "Words must be at least 3 letters long."
            )
            return
        }
       
        guard isNotStartWord(word: answer) else {
            wordError(
                title: "Same as root word",
                message: "You can't use the start word itself."
            )
            return
        }
       
        guard isOriginal(word: answer) else {
            wordError(
                title: "Word used already",
                message: "Be more original!"
            )
            return
        }
       
        guard isPossible(word: answer) else {
            wordError(
                title: "Word not possible",
                message: "You can't spell that word from '\(rootWord)'!"
            )
            return
        }
       
        guard isReal(word: answer) else {
            wordError(
                title: "Word not recognized",
                message: "You can't just make them up, you know!"
            )
            return
        }
       
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
       
        newWord = ""
    }
   
    func startGame() {
        guard let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") else {
            fatalError("Could not find start.txt in bundle.")
        }
       
        guard let startWords = try? String(contentsOf: startWordsURL, encoding: .utf8) else {
            fatalError("Could not load start.txt from bundle.")
        }
       
        let allWords = startWords.split(separator: "\n")
        rootWord = String(allWords.randomElement() ?? "silkworm")
        usedWords.removeAll()
        newWord = ""
    }
   
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
   
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
       
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
       
        return true
    }
   
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
       
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en"
        )
       
        return misspelledRange.location == NSNotFound
    }
   
    func isLongEnough(word: String) -> Bool {
        word.count >= 3
    }
   
    func isNotStartWord(word: String) -> Bool {
        word != rootWord
    }
   
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct WordRow: View {
    let word: String
   
    var body: some View {
        HStack(spacing: 12) {
            Text("🔤")
                .font(.title3)
           
            Image(systemName: "\(word.count).circle.fill")
                .foregroundStyle(.white.opacity(0.95))
           
            Text(word)
                .font(.headline)
                .foregroundStyle(.white)
        }
        .padding(.vertical, 6)
    }
}

struct GameTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.white)
            .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 3)
    }
}

struct SectionLabelModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline.weight(.semibold))
            .foregroundStyle(.white.opacity(0.92))
    }
}

struct ScoreTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2.bold())
            .foregroundStyle(.white)
    }
}

struct InfoTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.white.opacity(0.95))
    }
}

struct GameCardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(.white.opacity(0.12))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white.opacity(0.20), lineWidth: 1)
            )
            .clipShape(.rect(cornerRadius: 20))
            .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
    }
}

extension View {
    func gameTitleStyle() -> some View {
        modifier(GameTitleModifier())
    }
   
    func sectionLabelStyle() -> some View {
        modifier(SectionLabelModifier())
    }
   
    func scoreTextStyle() -> some View {
        modifier(ScoreTextModifier())
    }
   
    func infoTextStyle() -> some View {
        modifier(InfoTextModifier())
    }
   
    func gameCardStyle() -> some View {
        modifier(GameCardModifier())
    }
}

#Preview {
    ContentView()
}

/*
import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var score: Int {
        usedWords.reduce(0) { partialResult, word in
                partialResult + word.count
        }
    }
    
    var body: some View {
        List {
            Section {
                TextField("Enter your word", text: $newWord)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
            }
            
            Section("Score") {
                Text("Your score: \(score)")
            }
            
            Section("Used words") {
                ForEach(usedWords, id: \.self) { word in
                    HStack {
                        Image(systemName: "\(word.count).circle")
                        Text(word)
                    }
                }
            }
        }
        .navigationTitle(rootWord)
        .onSubmit(addNewWord)
        .onAppear(perform: startGame)
        .toolbar {
            Button("Restart") {
                startGame()
            }
        }
        .alert(errorTitle, isPresented: $showingError) {} message: {
            Text(errorMessage)
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        guard isLongEnough(word: answer) else {
            wordError(
                title: "Same as root word",
                message: "You can't use the start word itself."
            )
            return
        }
        
        guard isNotStartWord(word: answer) else {
            wordError(
                title: "Same as root word",
                message: "You can't use the start word itself."
            )
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(
                title: "Word used already",
                message: "Be more original!"
            )
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(
                title: "Word not possible",
                message: "You can't spell that word from '\(rootWord)'!"
            )
            return
        }
        
        guard isReal(word: answer) else {
            wordError(
                title: "Word not recognized",
                message: "You can't just make them up, you know!"
            )
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL, encoding: .utf8) {
                let allWords = startWords.split(separator: "\n")
                rootWord = String(allWords.randomElement() ?? "silkworm")
                
                usedWords.removeAll()
                newWord = ""
                
                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(
            in: word,
            range: range,
            startingAt: 0,
            wrap: false,
            language: "en"
        )
        
        return misspelledRange.location == NSNotFound
    }
    
    func isLongEnough(word: String) -> Bool {
        word.count >= 3
    }
    
    func isNotStartWord(word: String) -> Bool {
        word != rootWord
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

#Preview {
    ContentView()
}
*/
