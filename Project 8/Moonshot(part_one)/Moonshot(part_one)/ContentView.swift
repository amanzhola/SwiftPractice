//
//  ContentView.swift
//  Moonshot(part_one)
//
//  Created by Amanzhol on 24.03.2026.
//


import SwiftUI

struct ContentView: View {
    
    let layout = [
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
        GridItem(.adaptive(minimum: 80, maximum: 120)),
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
    
//    var body: some View {
//        ScrollView {
//            LazyVGrid(columns: layout) {
//                ForEach(0..<1000) {
//                    Text("Item \($0)")
//                }
//            }
//        }
//    }
}

//struct User: Codable {
//    let name: String
//    let address: Address
//}
//
//struct Address: Codable {
//    let street: String
//    let city: String
//}
//
//struct ContentView: View {
//    var body: some View {
//        Button("Decode JSON") {
//            let input = """
//            {
//                "name": "Taylor Swift",
//                "address": {
//                    "street": "555, Taylor Swift Avenue",
//                    "city": "Nashville"
//                }
//            }
//            """
//            
//            // more code to come here
//            let data = Data(input.utf8)
//            let decoder = JSONDecoder()
//            
//            if let user = try? decoder.decode(User.self, from: data) {
//                print(user.address.street)
//            }
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            List(0..<100) { row in
////                NavigationLink("Row \(row)") {
//                    Text("Detail \(row)")
////                }
//            }
//            .navigationTitle("SwiftUI")
//        }
//    }
//}


//struct ContentView: View {
//    var body: some View {
//        NavigationStack {
//            NavigationLink {
//                Text("Detail View")
//            } label: {
//                VStack {
//                    Text("This is the label")
//                    Text("So is this")
//                    Image(systemName: "star")
//                }
//                .font(.largeTitle)
//            }
//            .navigationTitle("SwiftUI")
//        }
//    }
//}

//struct CustomText: View {
//    let text: String
//    
//    var body: some View {
//        Text(text)
//    }
//    
//    init(text: String) {
//        print("Creating a new CustomText")
//        self.text = text
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText(text: "Item \($0)")
//                        .font(.title)
//                }
//            }
//        }
//    }
//}


//struct ContentView: View {
//    var body: some View {
//        ScrollView {
//            LazyVStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText(text: "Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
//    }
//}

#Preview {
    ContentView()
}

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        Image(.example2)
//            .resizable()
//            .scaledToFit()
//            .containerRelativeFrame(.horizontal) { size, axis in
//                size * 0.8
//            }
//    }
//}
//
//#Preview {
//    ContentView()
//}

//struct ContentView: View {
//    var body: some View {
//        Image(.example2)
//            .resizable()
//            .scaledToFit()
////            .scaledToFill()
////            .frame(width: 300, height: 300)
//    }
//}
//
//#Preview {
//    ContentView()
//}
