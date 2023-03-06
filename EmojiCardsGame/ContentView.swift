//
//  ContentView.swift
//  EmojiCardsGame
//
//  Created by Dmytro Savka on 01.03.2023.
//

import SwiftUI

struct ContentView: View {
        
    @State var emojis: [String] = ["🦈", "🦋", "🐠", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐸", "🐥", "🐤", "🐛", "🐺", "🦉", "🦆", "🐢", "🦖", "🐍", "🦑", "🦀", "🐞"]
    
    var body: some View {
        VStack {
            
            Text("Memorize")
                .font(.title)
                .bold()
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<Int.random(in: 8..<emojis.count)], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding()
            }
            .foregroundColor(.blue)
            .scrollIndicators(.hidden)
            
            Spacer()
            
            HStack(alignment: .bottom) {
                animalButton
                foodButton
                vehicleButton
            }
            .padding(.horizontal)
        }
    }
    
    var animalButton: some View {
        Button {
            emojis = ["🦈", "🦋", "🐠", "🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐸", "🐥", "🐤", "🐛", "🐺", "🦉", "🦆", "🐢", "🦖", "🐍", "🦑", "🦀", "🐞"].shuffled()
        } label: {
            VStack {
                Image(systemName: "pawprint.fill")
                    .font(.largeTitle)
                    .padding(.horizontal)
                Text("Animals")
            }
        }
    }
    
    var foodButton: some View {
        Button {
            emojis = ["🌽", "🍗", "🧀", "🥩", "🍓", "🍕", "🍏", "🍐", "🍑", "🍌", "🍋", "🍊", "🍍", "🥥", "🍇", "🍉", "🥑", "🥒", "🫑", "🍔", "🍟", "🥗", "🌮", "🍰"].shuffled()
        } label: {
            VStack {
                Image(systemName: "carrot.fill")
                    .font(.largeTitle)
                    .padding(.horizontal)
                Text("Food")
            }
        }
    }
    
    var vehicleButton: some View {
        Button {
            emojis = ["🚗", "🚕", "🚌", "✈️", "🚀", "🏎️", "🚓", "🚑", "🚒", "🚐", "🚚", "🛻", "🚛", "🚜", "🛴", "🚲", "🛵", "🏍️", "🛺", "🚔", "🚍", "🚘", "🚖", "🚅"].shuffled()
        } label: {
            VStack {
                Image(systemName: "car.fill")
                    .font(.largeTitle)
                    .padding(.horizontal)
                Text("Vehicles")
            }
        }
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var content: String
    
    var body: some View {
        ZStack {
            let rectangle = RoundedRectangle(cornerRadius: 20, style: .continuous)

            if isFaceUp {
                rectangle
                    .fill()
                    .foregroundColor(.white)
                rectangle
                    .stroke(lineWidth: 4)
                Text(content)
                    .font(.largeTitle)
                    .padding()
            }
            else {
                rectangle
                    .fill()
                rectangle
                    .stroke(lineWidth: 4)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
