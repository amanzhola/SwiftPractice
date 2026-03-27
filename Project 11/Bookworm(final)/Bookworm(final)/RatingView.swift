//
//  RatingView.swift
//  Bookworm(final)
//
//  Created by Amanzhol on 28.03.2026.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int

    var label = ""
    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor: Color = .yellow

    var body: some View {
        HStack(spacing: 0) {
            if !label.isEmpty {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    rating = number
                } label: {
                    image(for: number)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .foregroundStyle(number > rating ? offColor : onColor)
                        .frame(maxWidth: .infinity)
                        .contentShape(Rectangle())
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .buttonStyle(.plain)
        .accessibilityElement()
        .accessibilityLabel("Rating")
        .accessibilityValue("\(rating) out of \(maximumRating)")
    }

    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(5))
}
