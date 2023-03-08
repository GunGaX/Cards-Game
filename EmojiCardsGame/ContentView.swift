//
//  ContentView.swift
//  EmojiCardsGame
//
//  Created by Dmytro Savka on 01.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(1)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
            .padding()
        }
        .foregroundColor(.blue)
        .scrollIndicators(.hidden)
    }
}
    
//    var animalButton: some View {
//        Button {
//            emojis = ["🦈", "🦋", "🐠", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐸", "🐥", "🐤", "🐛", "🐺", "🦉", "🦆", "🐢", "🦖", "🐍", "🦑", "🦀", "🐞"].shuffled()
//        } label: {
//            VStack {
//                Image(systemName: "pawprint.fill")
//                    .font(.largeTitle)
//                    .padding(.horizontal)
//                Text("Animals")
//            }
//        }
//    }
    
//    var foodButton: some View {
//        Button {
//            emojis = ["🌽", "🍗", "🧀", "🥩", "🍓", "🍕", "🍏", "🍐", "🍑", "🍌", "🍋", "🍊", "🍍", "🥥", "🍇", "🍉", "🥑", "🥒", "🫑", "🍔", "🍟", "🥗", "🌮", "🍰"].shuffled()
//        } label: {
//            VStack {
//                Image(systemName: "carrot.fill")
//                    .font(.largeTitle)
//                    .padding(.horizontal)
//                Text("Food")
//            }
//        }
//    }
//
//    var vehicleButton: some View {
//        Button {
//            emojis = ["🚗", "🚕", "🚌", "✈️", "🚀", "🏎️", "🚓", "🚑", "🚒", "🚐", "🚚", "🛻", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍️", "🛺", "🚔", "🚍", "🚘", "🚖", "🚅"].shuffled()
//        } label: {
//            VStack {
//                Image(systemName: "car.fill")
//                    .font(.largeTitle)
//                    .padding(.horizontal)
//                Text("Vehicles")
//            }
//        }
//    }


struct CardView: View {
    
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let rectangle = RoundedRectangle(cornerRadius: 20, style: .continuous)
            
            if card.isFaceUp {
                rectangle
                    .fill()
                    .foregroundColor(.white)
                rectangle
                    .stroke(lineWidth: 4)
                Text(card.content)
                    .font(.largeTitle)
                    .padding()
            } else if card.isMatched {
                rectangle.opacity(0.4)
            } else {
                rectangle
                    .fill()
                rectangle
                    .stroke(lineWidth: 4)
            }
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGame()
        
        ContentView(viewModel: viewModel)
            .preferredColorScheme(.light)
        ContentView(viewModel: viewModel)
            .preferredColorScheme(.dark)
    }
}
