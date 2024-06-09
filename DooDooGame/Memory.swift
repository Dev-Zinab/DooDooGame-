////
////  Memory.swift
////  DooDooGame
////
////  Created by Raghad on 25/12/2023.
////
//
//import SwiftUI
//
//struct Memory: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    Memory()
//}


// SwiftUIView.swift

import Foundation
import SwiftUI

// Card class represents a card in the memory-matching game
class Card: Identifiable, ObservableObject {
    // Properties of a card
    var id = UUID()                  // Unique identifier for the card
    @Published var isFaceUp = false   // Indicates whether the card is face up or face down
    @Published var isMatched = false  // Indicates whether the card is matched with another
    var text: String                  // The content of the card (e.g., emoji)

    // Initializer to set up a card with a given text value
    init(text: String) {
        self.text = text
    }

    // Method to simulate the action of turning the card over
    func turnOver() {
        self.isFaceUp.toggle()
    }
}

// Array of emoji values representing different card contents
let cardValues: [String] = ["🦀", "🦈","🐙"]

// Constant defining the size of the card
let cardSize: CGFloat = 100

// Function to create a list of Card objects based on the cardValues array
func createCardlist() -> [Card] {
    // Create a blank list to store the generated cards
    var cardlist = [Card]()
    // For each value in cardValues, add two Card objects with the same value to the list
    for cardValue in cardValues {
        cardlist.append(Card(text: cardValue))
        cardlist.append(Card(text: cardValue))
    }
    
    return cardlist
}

// Single face-down card with a text value of "?"
let faceDownCard = Card(text: "?")
