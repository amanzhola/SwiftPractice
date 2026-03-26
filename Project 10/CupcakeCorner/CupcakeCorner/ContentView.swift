//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Amanzhol on 26.03.2026.
//

// part 3

// Checking for a valid address

import SwiftUI

struct ContentView: View {
    
    @State private var order = Order()
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        
                        Toggle("Add extra sprinkless", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Delivery Detials") {
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}

// part 2


// Taking basic order details -> single class store all data from prev struct + class mixture

//import SwiftUI
//
//struct ContentView: View {
//    
//    @State private var order = Order()
//    
//    var body: some View {
//        
//        NavigationStack {
//            Form {
//                Section {
//                    Picker("Select your cake type", selection: $order.type) {
//                        ForEach(Order.types.indices, id: \.self) {
//                            Text(Order.types[$0])
//                        }
//                    }
//                    
//                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
//                }
//                
//                Section {
//                    Toggle("Any special requests?", isOn: $order.specialRequestEnebled.animation())
//                    
//                    if order.specialRequestEnebled {
//                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
//                        
//                        Toggle("Add extra sprinkless", isOn: $order.addSprinkles)
//                    }
//                }
//                
//                Section {
//                    NavigationLink("Delivery Detials") {
//                        AddressView(order: order)
//                    }
//                }
//            }
//            .navigationTitle("Cupcake Corner")
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}

// Adding haptic effects

//import CoreHaptics
//import SwiftUI
//
//struct ContentView: View {
//    
//    @State private var engine: CHHapticEngine?
//    
//    var body: some View {
//        Button("Play Haptic", action: complexSuccess)
//            .onAppear(perform: prepareHaptics)
//    }
//    
//    func prepareHaptics() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        
//        do {
//            engine = try CHHapticEngine()
//            try engine?.start()
//        } catch {
//            print("There was an error creating the engine: \(error.localizedDescription)")
//        }
//    }
//    
//    func complexSuccess() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        
//        var events = [CHHapticEvent]()
//        
//        for i in stride(from: 0, to: 1, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
//            let even = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
//            events.append(even)
//        }
//        
//        for i in stride(from: 0, to: 1, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
//            let even = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
//            events.append(even)
//        }
//        
////        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
////        let sharpness = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
////        let even = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
////        events.append(even)
//        
//        do {
//            let pattern = try CHHapticPattern(events: events, parameters: [])
//            let player = try engine?.makePlayer(with: pattern)
//            try player?.start(atTime: 0)
//        } catch {
//            print("Failed to play pattern: \(error.localizedDescription)")
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}


//import SwiftUI
//
//struct ContentView: View {
//    
//    @State private var counter = 0
//    
//    var body: some View {
//        Button("Tap Count: \(counter)") {
//            counter += 1
//        }
//        .sensoryFeedback(.increase, trigger: counter)
//    }
//}
//
//#Preview {
//    ContentView()
//}

// Adding Codable conformance to an @Observable class

// fix encode and decode by manage of class re-writing by raw enum value _name to name

//import SwiftUI
//
//@Observable
//class User: Codable {
//    enum CodingKeys: String, CodingKey {
//        case _name = "name"
//    }
//    var name = "Taylor"
//}
//
//struct ContentView: View {
//    var body: some View {
//        Button("Encode Taylor", action: encodeTaylor)
//    }
//    
//    func encodeTaylor() {
//        let data = try! JSONEncoder().encode(User())
//        let str = String(decoding: data, as: UTF8.self)
//        print(str)
//    }
//}
//
//#Preview {
//    ContentView()
//}

//import SwiftUI
//
//@Observable
//class User: Codable {
//    var name = "Taylor"
//}
//
//struct ContentView: View {
//    var body: some View {
//        Button("Encode Taylor", action: encodeTaylor)
//    }
//    
//    func encodeTaylor() {
//        let data = try! JSONEncoder().encode(User())
//        let str = String(decoding: data, as: UTF8.self)
//        print(str)
//    }
//}
//
//#Preview {
//    ContentView()
//}

// part 1

// Validating and disabling forms

//import SwiftUI
//
//struct ContentView: View {
//    
//    @State private var username = ""
//    @State private var email = ""
//    
//    var disableForm: Bool {
//        username.count < 5 || email.count < 5
//    }
//    
//    var body: some View {
//        Form {
//            Section {
//                TextField("Username", text: $username)
//                TextField("Email", text: $email)
//            }
//            
//            Section {
//                Button("Create account") {
//                    print("Creating account...")
//                }
//            }
////            .disabled(username.isEmpty || email.isEmpty)
//            .disabled(disableForm)
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}

// Loading an image from a remote server

//import SwiftUI
//
//// third way of loading controllable image by handing error or finishing loading
//
//struct ContentView: View {
//    var body: some View {
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
//                if let image = phase.image {
//                    image
//                    .resizable()
//                    .scaledToFill()
//                } else if phase.error != nil {
//                    Text("There was an error loading the image")
//                } else {
//                    ProgressView()
//                }
//        }
//        .frame(width: 200, height: 200)
//    }
//}
//
//#Preview {
//    ContentView()
//}

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//                image
//                .resizable()
//                .scaledToFill()
//        } placeholder: {
//            ProgressView()
//        }
//        .frame(width: 200, height: 200)
//    }
//}
//
//#Preview {
//    ContentView()
//}

//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 3)
//    }
//}
//
//#Preview {
//    ContentView()
//}

// sending and receving Codable data with URLSession and SwiftUI

//import SwiftUI
//
//struct Response: Codable {
//    
//    var results: [Result]
//}
//
//struct Result: Codable {
//    
//    var trackId: Int
//    var trackName: String
//    var collectionName: String
//}
//
//struct ContentView: View {
//    
//    @State private var results = [Result]()
//    
//    var body: some View {
//        List(results, id: \.trackId) { item in
//            VStack(alignment: .leading) {
//                Text(item.trackName)
//                    .font(.headline)
//                
//                Text(item.collectionName)
//            }
//        }
//        .task {
//            await loadData()
//        }
//    }
//    
//    func loadData() async {
//        
//        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
//            print("Invalid URL")
//            return
//        }
//        
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            
//            // more code to come -> decode using JSON Decoder
//            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                results = decodedResponse.results
//            }
//            
//        } catch {
//            print("Invalid data")
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}
