//
//  EmojiMemoryGame.swift
//  EmojiCardsGame
//
//  Created by Dmytro Savka on 08.03.2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🦈", "🦋", "🐠", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐸", "🐥", "🐤", "🐛", "🐺", "🦉", "🦆", "🐢", "🦖", "🐍", "🦑", "🦀", "🐞"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 5) { pairIndex in
            emojis[pairIndex]
        }
    }
        
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
