//
//  ContentView.swift
//  RockPaperScissor(updated)
//
//  Created by Amanzhol on 21.03.2026.
//

import SwiftUI

struct ContentView: View {
    let moves = ["🪨", "📄", "✂️"]

    @State private var appChoice = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var questionCount = 0
    @State private var showingScore = false

    let maxQuestions = 10

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.blue.opacity(0.7), .purple.opacity(0.7)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                Text("Rock, Paper, Scissors")
                    .gameTitleStyle()
                    .foregroundStyle(.white)

                Text("Score: \(score)")
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(.white)

                VStack(spacing: 12) {
                    Text("App chose")
                        .instructionStyle()

                    Text(moves[appChoice])
                        .font(.system(size: 120))

                    Text(shouldWin ? "You must WIN" : "You must LOSE")
                        .font(.title2.bold())
                        .foregroundStyle(.purple)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))

                HStack(spacing: 20) {
                    ForEach(0..<3) { number in
                        MoveButton(symbol: moves[number]) {
                            playerTapped(number)
                        }
                    }
                }

                Text("Question: \(questionCount)/\(maxQuestions)")
                    .font(.headline)
                    .foregroundStyle(.white.opacity(0.9))
            }
            .padding()
        }
        .alert("Game Over", isPresented: $showingScore) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Your final score is \(score)")
        }
    }

    func playerTapped(_ playerMove: Int) {
        let winningMoves = [1, 2, 0]
        let losingMoves = [2, 0, 1]

        let correctMove = shouldWin ? winningMoves[appChoice] : losingMoves[appChoice]

        if playerMove == correctMove {
            score += 1
        } else {
            score -= 1
        }

        questionCount += 1

        if questionCount == maxQuestions {
            showingScore = true
        } else {
            nextRound()
        }
    }

    func nextRound() {
        appChoice = Int.random(in: 0...2)
        shouldWin.toggle()
    }

    func restartGame() {
        score = 0
        questionCount = 0
        appChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
}

struct MoveButton: View {
    let symbol: String
    let action: () -> Void

    var body: some View {
        Button(symbol, action: action)
            .font(.system(size: 60))
            .frame(width: 90, height: 90)
            .background(.white.opacity(0.2))
            .clipShape(.circle)
    }
}

struct GameTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.blue)
    }
}

struct InstructionModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.secondary)
    }
}

extension View {
    func gameTitleStyle() -> some View {
        modifier(GameTitleModifier())
    }

    func instructionStyle() -> some View {
        modifier(InstructionModifier())
    }
}

#Preview {
    ContentView()
}
