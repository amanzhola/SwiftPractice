//
//  ContentView.swift
//  MultiplyFun
//
//  Created by Amanzhol on 23.03.2026.
//

import SwiftUI

struct Question {
    let text: String
    let correctAnswer: Int
    let options: [Int]
}

enum GameState {
    case settings
    case playing
    case finished
}

struct ContentView: View {
    @State private var gameState: GameState = .settings
   
    @State private var maxTable = 2
    @State private var questionCount = 5
   
    @State private var questions: [Question] = []
    @State private var currentQuestionIndex = 0
    @State private var score = 0
   
    @State private var selectedAnswer: Int? = nil
    @State private var answerWasCorrect = false
    @State private var showingAnswerFeedback = false
   
    let questionOptions = [5, 10, 20]
   
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [.purple.opacity(0.25), .pink.opacity(0.25), .yellow.opacity(0.25)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
               
                switch gameState {
                case .settings:
                    settingsView
                case .playing:
                    gameView
                case .finished:
                    resultView
                }
            }
            .navigationTitle("Multiply Fun")
            .animation(.easeInOut, value: gameState)
        }
    }
   
    var settingsView: some View {
        VStack(spacing: 24) {
            Spacer()
           
            Text("🌟 Multiplication Game 🌟")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
           
            Text("Pick your level and let’s play!")
                .font(.title3)
                .foregroundStyle(.secondary)
           
            VStack(spacing: 16) {
                Text("Practice up to table \(maxTable)")
                    .font(.headline)
               
                Stepper("Up to \(maxTable)", value: $maxTable, in: 2...12)
                    .padding()
                    .background(.white.opacity(0.85))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding()
            .background(.blue.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: 20))
           
            VStack(spacing: 16) {
                Text("How many questions?")
                    .font(.headline)
               
                HStack(spacing: 12) {
                    ForEach(questionOptions, id: \.self) { option in
                        Button {
                            questionCount = option
                        } label: {
                            Text("\(option)")
                                .font(.title3.bold())
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(questionCount == option ? .orange : .white.opacity(0.85))
                                .foregroundStyle(questionCount == option ? .white : .black)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .shadow(radius: questionCount == option ? 6 : 2)
                        }
                    }
                }
            }
            .padding()
            .background(.green.opacity(0.12))
            .clipShape(RoundedRectangle(cornerRadius: 20))
           
            Button {
                startGame()
            } label: {
                Text("Start Game 🚀")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.pink)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .shadow(radius: 8)
            }
           
            Spacer()
        }
        .padding()
    }
   
    var gameView: some View {
        let currentQuestion = questions[currentQuestionIndex]
       
        return VStack(spacing: 24) {
            Spacer()
           
            Text("Question \(currentQuestionIndex + 1) / \(questions.count)")
                .font(.headline)
                .padding(.horizontal, 18)
                .padding(.vertical, 8)
                .background(.white.opacity(0.8))
                .clipShape(Capsule())
           
            Text("Score: \(score)")
                .font(.title3.bold())
                .foregroundStyle(.blue)
           
            VStack(spacing: 12) {
                Text("What is")
                    .font(.title2)
                    .foregroundStyle(.secondary)
               
                Text(currentQuestion.text)
                    .font(.system(size: 44, weight: .heavy))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.9))
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .scaleEffect(showingAnswerFeedback && answerWasCorrect ? 1.08 : 1.0)
            }
            .padding()
           
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                ForEach(currentQuestion.options, id: \.self) { option in
                    Button {
                        chooseAnswer(option)
                    } label: {
                        Text("\(option)")
                            .font(.system(size: 28, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 90)
                            .background(buttonColor(for: option))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .scaleEffect(scaleForButton(option))
                            .shadow(radius: 6)
                    }
                    .disabled(showingAnswerFeedback)
                }
            }
            .padding(.horizontal)
           
            if showingAnswerFeedback {
                Text(answerWasCorrect ? "✅ Correct!" : "❌ Oops!")
                    .font(.title.bold())
                    .foregroundStyle(answerWasCorrect ? .green : .red)
                    .transition(.scale.combined(with: .opacity))
            }
           
            Spacer()
        }
        .padding()
    }
   
    var resultView: some View {
        VStack(spacing: 24) {
            Spacer()
           
            Text("🎉 Game Over! 🎉")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
           
            Text("You got \(score) out of \(questions.count) correct!")
                .font(.title2)
                .multilineTextAlignment(.center)
           
            Text(resultEmoji())
                .font(.system(size: 70))
           
            Button {
                resetGame()
            } label: {
                Text("Play Again 🔁")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 18))
                    .shadow(radius: 8)
            }
            .padding(.horizontal)
           
            Spacer()
        }
        .padding()
    }
   
    func startGame() {
        questions = generateQuestions()
        currentQuestionIndex = 0
        score = 0
        selectedAnswer = nil
        showingAnswerFeedback = false
        gameState = .playing
    }
   
    func generateQuestions() -> [Question] {
        var generatedQuestions: [Question] = []
       
        for _ in 0..<questionCount {
            let left = Int.random(in: 2...maxTable)
            let right = Int.random(in: 1...12)
            let answer = left * right
           
            var options = [answer]
           
            while options.count < 4 {
                let wrongAnswer = answer + Int.random(in: -10...10)
                if wrongAnswer > 0 && !options.contains(wrongAnswer) {
                    options.append(wrongAnswer)
                }
            }
           
            options.shuffle()
           
            let question = Question(
                text: "\(left) × \(right)",
                correctAnswer: answer,
                options: options
            )
           
            generatedQuestions.append(question)
        }
       
        return generatedQuestions
    }
   
    func chooseAnswer(_ answer: Int) {
        selectedAnswer = answer
        answerWasCorrect = answer == questions[currentQuestionIndex].correctAnswer
       
        if answerWasCorrect {
            score += 1
        }
       
        withAnimation(.spring()) {
            showingAnswerFeedback = true
        }
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            goToNextQuestion()
        }
    }
   
    func goToNextQuestion() {
        selectedAnswer = nil
        showingAnswerFeedback = false
       
        if currentQuestionIndex + 1 < questions.count {
            currentQuestionIndex += 1
        } else {
            gameState = .finished
        }
    }
   
    func resetGame() {
        gameState = .settings
        questions = []
        currentQuestionIndex = 0
        score = 0
        selectedAnswer = nil
        showingAnswerFeedback = false
    }
   
    func buttonColor(for option: Int) -> Color {
        guard let selectedAnswer else {
            return [.blue, .purple, .orange, .pink].randomElement() ?? .blue
        }
       
        let correctAnswer = questions[currentQuestionIndex].correctAnswer
       
        if showingAnswerFeedback {
            if option == correctAnswer {
                return .green
            } else if option == selectedAnswer {
                return .red
            }
        }
       
        return .gray
    }
   
    func scaleForButton(_ option: Int) -> CGFloat {
        guard let selectedAnswer else { return 1.0 }
       
        if option == selectedAnswer {
            return 1.08
        }
       
        return 1.0
    }
   
    func resultEmoji() -> String {
        let ratio = Double(score) / Double(max(questions.count, 1))
       
        if ratio == 1.0 {
            return "🏆"
        } else if ratio >= 0.7 {
            return "🌟"
        } else if ratio >= 0.4 {
            return "🙂"
        } else {
            return "💪"
        }
    }
}

#Preview {
    ContentView()
}
