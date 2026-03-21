//
//  ContentView.swift
//  GuessTheFlag(part3)
//
//  Created by Amanzhol on 20.03.2026.
//

import SwiftUI

struct ContentView: View {
   
    enum ActiveAlert: String, Identifiable {
        case result
        case final
       
        var id: String { rawValue }
    }
   
    @State private var countries = [
        "Estonia", "France", "Germany", "Ireland", "Italy",
        "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"
    ].shuffled()
   
    @State private var correctAnswer = Int.random(in: 0...2)
   
    @State private var activeAlert: ActiveAlert?
   
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
   
    @State private var score = 0
    @State private var questionCount = 0
   
    let maxQuestions = 8
   
    var body: some View {
       
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                ],
                center: .top,
                startRadius: 200,
                endRadius: 700
            )
            .ignoresSafeArea()
           
            VStack {
               
                Spacer()
               
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
               
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                       
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                   
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
               
                Spacer()
                Spacer()
               
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
               
                Text("Question: \(min(questionCount + 1, maxQuestions))/\(maxQuestions)")
                    .foregroundStyle(.white.opacity(0.85))
                    .font(.headline)
               
                Spacer()
            }
            .padding()
        }
        .alert(item: $activeAlert) { alert in
            switch alert {
            case .result:
                return Alert(
                    title: Text(scoreTitle),
                    message: Text(scoreMessage),
                    dismissButton: .default(Text("Continue")) {
                        continueGame()
                    }
                )
               
            case .final:
                return Alert(
                    title: Text("Game Over"),
                    message: Text(finalMessage()),
                    dismissButton: .default(Text("Restart")) {
                        resetGame()
                    }
                )
            }
        }
    }
   
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            scoreMessage = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong"
            score -= 1
            scoreMessage = "Wrong! That's the flag of \(countries[number]).\nYour score is \(score)"
        }
       
        questionCount += 1
        activeAlert = .result
    }
   
    func continueGame() {
        if questionCount == maxQuestions {
            activeAlert = .final
        } else {
            askQuestion()
        }
    }
   
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
   
    func resetGame() {
        score = 0
        questionCount = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
   
    func finalMessage() -> String {
        let result: String
       
        if score == maxQuestions {
            result = "Perfect score! Amazing!"
        } else if score >= 6 {
            result = "Great job!"
        } else if score >= 4 {
            result = "Not bad!"
        } else {
            result = "Keep practicing!"
        }
       
        return "\(result)\nFinal score: \(score) out of \(maxQuestions)."
    }
}

#Preview {
    ContentView()
}
