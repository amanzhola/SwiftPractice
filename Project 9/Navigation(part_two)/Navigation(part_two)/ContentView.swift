//
//  ContentView.swift
//  Navigation(part_two)
//
//  Created by Amanzhol on 25.03.2026.
//

import SwiftUI

// saving NavigationPath example on Int and NavigationPath

// version of NavigationPath
@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        
        path = NavigationPath()
    }
    
    func save() {
        guard let representation = path.codable else { return }
        
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}


// version of Int
//@Observable
//class PathStore {
//    var path: [Int] {
//        didSet {
//            save()
//        }
//    }
//    
//    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
//    
//    init() {
//        if let data = try? Data(contentsOf: savePath) {
//            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
//                path = decoded
//                return
//            }
//        }
//        
//        path = []
//    }
//    
//    func save() {
//        do {
//            let data = try JSONEncoder().encode(path)
//            try data.write(to: savePath)
//        } catch {
//            print("Failed to save navigation data")
//        }
//    }
//}

// saving NavigationPath lesson for DetailsView and ContentView ->>>

struct DetailView: View {
    var number: Int
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

struct ContentView: View {
    
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i)
                }
        }
    }

//struct DetailView: View {
//    var number: Int
//    @Binding var path: NavigationPath
//    
//    var body: some View {
//        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
//            .navigationTitle("Number: \(number)")
//            .toolbar {
//                Button("Home") {
//                    path = NavigationPath()
//                }
//            }
//    }
//}
//
//struct ContentView: View {
//    
//    @State private var path = NavigationPath()
//    
//    var body: some View {
//        NavigationStack(path: $path) {
//            DetailView(number: 0, path: $path)
//                .navigationDestination(for: Int.self) { i in
//                    DetailView(number: i, path: $path)
//                }
//        }
//    }

// option2 via NavigationPath

//struct DetailView: View {
//    var number: Int
//    @Binding var path: NavigationPath
//    
//    var body: some View {
//        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
//            .navigationTitle("Number: \(number)")
//            .toolbar {
//                Button("Home") {
//                    path = NavigationPath()
//                }
//            }
//    }
//}
//
//struct ContentView: View {
//    
//    @State private var path = NavigationPath()
//    
//    var body: some View {
//        NavigationStack(path: $path) {
//            DetailView(number: 0, path: $path)
//                .navigationDestination(for: Int.self) { i in
//                    DetailView(number: i, path: $path)
//                }
//        }
//    }


// option 1 via removing
    
//struct DetailView: View {
//    var number: Int
//    @Binding var path: [Int]
//    
//    var body: some View {
//        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
//            .navigationTitle("Number: \(number)")
//            .toolbar {
//                Button("Home") {
//                    path.removeAll()
//                }
//            }
//    }
//}
//
//struct ContentView: View {
//    
//    @State private var path = [Int]()
//    
//    var body: some View {
//        NavigationStack(path: $path) {
//            DetailView(number: 0, path: $path)
//                .navigationDestination(for: Int.self) { i in
//                    DetailView(number: i, path: $path)
//                }
//        }
//    }

//struct DetailView: View {
//    var number: Int
//    
//    var body: some View {
//        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
//            .navigationTitle("Number: \(number)")
//    }
//}
//
//struct ContentView: View {
//    
//    @State private var path = [Int]()
//    
//    var body: some View {
//        NavigationStack(path: $path) {
//            DetailView(number: 0)
//                .navigationDestination(for: Int.self) { i in
//                    DetailView(number: i)
//                }
//        }
//    }
    
//    @State private var path = NavigationPath()
//    
//    var body: some View {
//        
////        NavigationStack(path: $path) {
////            List {
////                ForEach(0..<5) { i in
////                    NavigationLink("Select Number: \(i)", value: i)
////                }
////                
////                ForEach(0..<5) { i in
////                    NavigationLink("Select String: \(i)", value: String(i))
////                }
////            }
////            .toolbar {
////                Button("Push 556") {
////                    path.append(556)
////                }
////                
////                Button("Push Hello") {
////                    path.append("Hello")
////                }
////            }
////            .navigationDestination(for: Int.self) { selection in
////                Text("You selected the number \(selection)")
////            }
////            .navigationDestination(for: String.self) { selection in
////                Text("You selected the string \(selection)")
////            }
////        }
//        
////        NavigationStack {
////            List {
////                ForEach(0..<5) { i in
////                    NavigationLink("Select Number: \(i)", value: i)
////                }
////                
////                ForEach(0..<5) { i in
////                    NavigationLink("Select String: \(i)", value: String(i))
////                }
////            }
////            .navigationDestination(for: Int.self) { selection in
////                Text("You selected the number \(selection)")
////            }
////            .navigationDestination(for: String.self) { selection in
////                Text("You selected the string \(selection)")
////            }
////        }
//    }
}

#Preview {
    ContentView()
}


//struct ContentView: View {
//    
//    @State private var path = [Int]()
//    
//    var body: some View {
//        NavigationStack(path: $path) {
//            
//            VStack {
//                Button("Show 32") {
//                    path = [32]
//                }
//                
//                Button("Show 64") {
//                    path.append(64)
//                }
//                
//                Button("Show 32 then 64") {
//                    path = [32, 64]
//                }
//            }
//            .navigationDestination(for: Int.self) { selection in
//                Text("You selected: \(selection)")
//            }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
