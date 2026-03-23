//
//  ContentView.swift
//  Animations(part_three)
//
//  Created by Amanzhol on 23.03.2026.
//

import SwiftUI

// flag moving version 2

struct ContentView: View {
   
    enum ActiveAlert: String, Identifiable {
        case result
        case final
       
        var id: String { rawValue }
    }
   
    @State private var selectedFlag: Int? = nil
    @State private var animationAmount = 0.0
    @State private var showingResult = false
   
    @State private var countries = [
        "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"
    ].shuffled()
   
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var activeAlert: ActiveAlert?
   
    @State private var scoreTitle: String = ""
    @State private var scoreMessage: String = ""
   
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
                    .gameTitleStyle()
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
                           
                            selectedFlag = number
                           
                            withAnimation(.easeInOut(duration: 1)) {
                                animationAmount += 360
                            }
                           
                            flagTapped(number)
                           
                        } label: {
                           
                            FlagImage(imageName: countries[number])
                                .rotation3DEffect(
                                    .degrees(selectedFlag == number ? animationAmount : 0),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .opacity(selectedFlag == nil || selectedFlag == number ? 1 : 0.25)
                                .scaleEffect(selectedFlag == nil || selectedFlag == number ? 1 : 0.7)
                        }
                        .disabled(showingResult)
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
           
            if showingResult {
               
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
               
                VStack(spacing: 16) {
                   
                    Text(scoreTitle)
                        .font(.title.bold())
                        .foregroundStyle(.cyan)
                   
                    Text(scoreMessage)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.yellow)
                   
                    Button("Continue") {
                       
                        showingResult = false
                       
                        if questionCount == maxQuestions {
                            activeAlert = .final
                        } else {
                            continueGame()
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 10)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.white.opacity(0.2))
                    )
                    .shadow(radius: 10)
                }
                .padding(24)
            }
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
            scoreMessage = "Wrong! That's the flage of \(countries[number]).\nYour score is \(score)."
        }
       
        questionCount += 1
        showingResult = true
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
        selectedFlag = nil
        animationAmount = 0
    }
   
    func resetGame() {
        score = 0
        questionCount = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedFlag = nil
        animationAmount = 0
        showingResult = false
        activeAlert = nil
    }
   
    func finalMessage() -> String {
        let result: String
       
        if score == maxQuestions {
            result = "Congratulations! You got them all right."
        } else if score >= 6 {
            result = "You did pretty well! Keep going."
        } else if score >= 4 {
            result = "You got some right, but there's room for improvement."
        } else {
            result = "Keep practicing, you'll get there!"
        }
       
        return "\(result)\nFinal score: \(score) out of \(maxQuestions)"
    }
}

struct FlagImage: View {
   
    let imageName: String
   
    private let flagWidth: CGFloat = 240
    private let flagHeight: CGFloat = 140
    private let slices: Int = 36
    private let waveHeight: CGFloat = 10
    private let speed: Double = 2.2
   
    var body: some View {
        TimelineView(.animation) { timeline in
            let t = timeline.date.timeIntervalSinceReferenceDate
            let phase = t * speed
            let sliceWidth = flagWidth / CGFloat(slices)
           
            HStack(spacing: 0) {
                ForEach(0..<slices, id: \.self) { index in
                    FlagSlice(
                        imageName: imageName,
                        index: index,
                        slices: slices,
                        flagWidth: flagWidth,
                        flagHeight: flagHeight,
                        sliceWidth: sliceWidth,
                        waveHeight: waveHeight,
                        phase: phase
                    )
                }
            }
            .frame(width: flagWidth, height: flagHeight)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.white.opacity(0.18), lineWidth: 1)
            )
            .shadow(radius: 5)
        }
    }
}

struct FlagSlice: View {
   
    let imageName: String
    let index: Int
    let slices: Int
    let flagWidth: CGFloat
    let flagHeight: CGFloat
    let sliceWidth: CGFloat
    let waveHeight: CGFloat
    let phase: Double
   
    private var progress: CGFloat {
        CGFloat(index) / CGFloat(max(slices - 1, 1))
    }
   
    private var wave: Double {
        sin((Double(progress) * .pi * 2) + phase)
    }
   
    private var xOffset: CGFloat {
        -CGFloat(index) * sliceWidth
    }
   
    private var yOffset: CGFloat {
        waveHeight * CGFloat(wave) * progress
    }
   
    private var rotation: Double {
        7.0 * wave * Double(progress)
    }
   
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: flagWidth, height: flagHeight)
            .offset(x: xOffset)
            .frame(width: sliceWidth, height: flagHeight, alignment: .leading)
            .clipped()
            .offset(y: yOffset)
            .rotation3DEffect(
                .degrees(rotation),
                axis: (x: 0, y: 1, z: 0),
                anchor: .leading
            )
    }
}

struct GameTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.blue)
    }
}

extension View {
    func gameTitleStyle() -> some View {
        modifier(GameTitleModifier())
    }
}

#Preview {
    ContentView()
}


/*
import SwiftUI

// flag moving version 1
 
struct ContentView: View {
   
    enum ActiveAlert: String, Identifiable {
        case result
        case final
       
        var id: String { rawValue }
    }
   
    @State private var selectedFlag: Int? = nil
    @State private var animationAmount = 0.0
    @State private var showingResult = false
   
    @State private var countries = [
        "Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"
    ].shuffled()
   
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var activeAlert: ActiveAlert?
   
    @State private var scoreTitle: String = ""
    @State private var scoreMessage: String = ""
   
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
                    .gameTitleStyle()
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
                           
                            selectedFlag = number
                           
                            withAnimation {
                                animationAmount += 360
                            }
                           
                            flagTapped(number)
                           
                        } label: {
                           
                            FlagImage(imageName: countries[number])
                                .rotation3DEffect(
                                    .degrees(selectedFlag == number ? animationAmount : 0),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .opacity(selectedFlag == nil || selectedFlag == number ? 1 : 0.25)
                                .scaleEffect(selectedFlag == nil || selectedFlag == number ? 1 : 0.7)
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
           
            if showingResult {
               
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
               
                VStack(spacing: 16) {
                   
                    Text(scoreTitle)
                        .font(.title.bold())
                        .foregroundStyle(.cyan)
                   
                    Text(scoreMessage)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.yellow)
                   
                    Button("Continue") {
                       
                        showingResult = false
                       
                        if questionCount == maxQuestions {
                            activeAlert = .final
                        } else {
                            continueGame()
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 10)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.white.opacity(0.2))
                    )
                    .shadow(radius: 10)
                }
            }
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
            scoreMessage = "Wrong! That's the flage of \(countries[number]).\nYour score is \(score)."
        }
       
        questionCount += 1
        showingResult = true
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
        selectedFlag = nil
        animationAmount = 0
    }
   
    func resetGame() {
        score = 0
        questionCount = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedFlag = nil
        animationAmount = 0
        showingResult = false
        activeAlert = nil
    }
   
    func finalMessage() -> String {
        let result: String
       
        if score == maxQuestions {
            result = "Congratulations! You got them all right."
        } else if score >= 6 {
            result = "You did pretty well! Keep going."
        } else if score >= 4 {
            result = "You got some right, but there's room for improvement."
        } else {
            result = "Keep practicing, you'll get there!"
        }
       
        return "\(result)\nFinal score: \(score) out of \(maxQuestions)"
    }
}

struct FlagImage: View {
   
    let imageName: String
    @State private var waving = false
   
    var body: some View {
       
        Image(imageName)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 5)
            .rotation3DEffect(
                .degrees(waving ? 8 : -8),
                axis: (x: 0, y: 1, z: 0),
                anchor: .leading
            )
            .onAppear {
               
                withAnimation(
                    .easeInOut(duration: 1.1)
                    .repeatForever(autoreverses: true)
                ) {
                    waving.toggle()
                }
            }
    }
}

struct GameTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.blue)
    }
}

extension View {
    func gameTitleStyle() -> some View {
        modifier(GameTitleModifier())
    }
}

#Preview {
    ContentView()
}
*/
