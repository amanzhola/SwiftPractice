//
//  ContentView.swift
//  RockPaperScissors
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
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Score: \(score)")
                .font(.title2)
            
            Text("App chose")
                .font(.headline)
            
            Text(moves[appChoice])
                .font(.system(size:120))
            
            Text(shouldWin ? "You must WIN" : "You must LOSE")
                .font(.title2)
                .bold()
            
            HStack(spacing: 20) {
                Button(moves[0]) {
                    playerTapped(0)
                }
                .font(.system(size: 60))
                
                Button(moves[1]) {
                    playerTapped(1)
                }
                .font(.system(size: 60))
                
                Button(moves[2]) {
                    playerTapped(2)
                }
                .font(.system(size: 60))
                
            }
            
            Text("Question: \(questionCount)/10")
                .font(.headline)
        }
        .padding()
        .alert("Game Over", isPresented: $showingScore) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Your final score is \(score)")
        }
        
    }
        
    func playerTapped(_ playerMove: Int) {
        let winningMoves = [1, 2, 0]
        let lostMoves = [2, 0, 1]
        
        let correctMove = shouldWin ? winningMoves[appChoice] : lostMoves[appChoice]
        
        if playerMove == correctMove {
            score += 1
        } else {
            score -= 1
        }
        
        questionCount += 1
        
        if questionCount == 10 {
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

#Preview {
    ContentView()
}
