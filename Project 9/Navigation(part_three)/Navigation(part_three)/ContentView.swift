//
//  ContentView.swift
//  Navigation(part_three)
//
//  Created by Amanzhol on 25.03.2026.
//

import SwiftUI

// making your navigation title editable

struct ContentView: View {
    
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}


//// placing toolbar buttons in exact location
//
//struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            Text("Hello, world!")
//                .toolbar {
//                    ToolbarItemGroup(placement: .topBarLeading) {
//                        Button("Tap Me") {
//                            // button action code
//                        }
//                    
//                        Button("Or Tap Me") {
//                            // button action code
//                        }
//                    }
//                }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}

//struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            Text("Hello, world!")
//                .toolbar {
//                    ToolbarItem(placement: .topBarLeading) {
//                        Button("Tap Me") {
//                            // button action code
//                        }
//                    }
//                    
//                    ToolbarItem(placement: .topBarLeading) {
//                        Button("Or Tap Me") {
//                            // button action code
//                        }
//                    }
//                }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}


//struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            Text("Hello, world!")
//                .toolbar {
//                    ToolbarItem(placement: .confirmationAction) {
//                        Button("Tap Me") {
//                            // button action code
//                        }
//                    }
//                }
//                .navigationBarBackButtonHidden()
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}

//struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            List(0..<100) { i in
//                    Text("Row \(i)")
//            }
//            .navigationTitle("Title goes here")
//            .navigationBarTitleDisplayMode(.inline)
//            .toolbarBackground(.blue, for: .navigationBar)
//            .toolbarColorScheme(.dark)
////            .toolbar(.hidden, for: .navigationBar)
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
