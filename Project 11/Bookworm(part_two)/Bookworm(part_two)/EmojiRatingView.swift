//
//  EmojiRatingView.swift
//  Bookworm(part_two)
//
//  Created by Amanzhol on 27.03.2026.
//

// + Building a list with @Query
import SwiftUI

struct EmojiRatingView: View {
    
    let rating: Int
    
    var body: some View {
        switch rating {
        case 1: // Control + Command + Space -> Откроется окно с эмодзи 😄
            Text("🙁")
        case 2: Text("🥱")
        case 3: Text("🫤")
        case 4: Text("😊")
        default: Text("🤯")
        }
    }
}

#Preview {
    EmojiRatingView(rating: 3)
}
