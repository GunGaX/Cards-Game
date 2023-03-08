//
//  EmojiCardsGameApp.swift
//  EmojiCardsGame
//
//  Created by Dmytro Savka on 01.03.2023.
//

import SwiftUI

@main
struct EmojiCardsGameApp: App {
    
    let viewModel = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
