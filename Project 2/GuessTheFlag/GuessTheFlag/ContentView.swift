//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Amanzhol on 20.03.2026.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        
        Button("Show alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
//            Button("OK") {}
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Please read this.")
        }
        
//        Button {
//            print("Button was tapped")
//        } label: {
//            
//            Label("Edit", systemImage: "pencil")
//                .padding()
//                .foregroundStyle(.white)
//                .background(.red)
//            
////            HStack {
////                Image(systemName: "pencil.circle")
////                Text("Edit")
////            }
//        }
        
//        Button("Edit", systemImage: "pencil") {
//            print("Button was tapped")
//        }
        
//        Image(decorative: "Singapore")
        
//        Button {
//            print("Button was tapped")
//        } label: {
//            Text("Tap me!")
//                .padding()
//                .foregroundStyle(.white)
//                .background(.red)
//        }
        
//        VStack {
//            Button("Button 1"){}
//                .buttonStyle(.bordered)
//            
//            Button("Button 2", role: .destructive){}
//                .buttonStyle(.bordered)
//            
//            Button("Button 3"){}
//                .buttonStyle(.borderedProminent)
//            
//            Button("Button 4", role: .destructive){}
//                .buttonStyle(.borderedProminent)
//        }
        
//        Button("Delete selection", role: .destructive, action: executeDelete)
               
//        Text("Your content")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .foregroundStyle(.white)
//            .background(.indigo .gradient)
        
//        AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .center)
        
//        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 20, endRadius: 200)
        
//        LinearGradient(stops: [
//            Gradient.Stop(color: .white, location: 0.45),
//            Gradient.Stop(color: .black, location: 0.55)
//        ], startPoint: .top, endPoint: .bottom)

//        LinearGradient(colors:[.white, .black], startPoint: .top, endPoint: .bottom)
        
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//            
//            Text("Your content")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()
        
//        ZStack {
//            Color.secondary
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
//            Text("Your content")
//        }
//        .background(.blue)
        
//        ZStack {
//            Color.red
//                .frame(width: 200, height: 200)
//            Text("Your content")
//        }
        
//        ZStack {
//            Color.red
//            Text("Your content")
////                .background(.red)
//        }
//        .background(.red)
        
//        ZStack {
//            Text("Hello, world!")
//            Text("This is another text view")
//        }
        
//        VStack {
//            Spacer()
//            
//            Text("First")
//            Text("Second")
//            Text("Third")
//            
//            Spacer()
//            Spacer()
//        }
        
//        HStack(spacing: 20) {
//            Text("Hello, world!")
//            Text("This is another text view")
//        }
        
//        VStack(alignment: .leading) {
//            Text("Hello, world!")
//            Text("This is another text view")
//        }
        
//    }
    
    // require for Buttons and images lesson
//    func executeDelete() {
//        print("Now deleting...")
    }
}

#Preview {
    ContentView()
}
