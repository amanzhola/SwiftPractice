//
//  ContentView.swift
//  Animations(part_one)
//
//  Created by Amanzhol on 23.03.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 0.0
        
    var body: some View {
            
            Button("Tap Me") {
                
                withAnimation(.spring(duration: 1, bounce: 0.5)) {
                    animationAmount += 360
                }
                
//                withAnimation {
//                    animationAmount += 360
//                }
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

/*
struct ContentView: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
    }
}
*/
/*
struct ContentView: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
//            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 2)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
//        .animation(
//            .easeInOut(duration: 2)
//                .repeatCount(2, autoreverses: true),
////            .delay(1),
//            value: animationAmount
//        )
        
//        .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
//        .animation(.linear, value: animationAmount)
//        .animation(.default, value: animationAmount)
    }
}
*/
#Preview {
    ContentView()
}
