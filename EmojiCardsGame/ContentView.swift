//
//  ContentView.swift
//  EmojiCardsGame
//
//  Created by Dmytro Savka on 01.03.2023.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🦈", "🦋", "🐠", "🦚", "🌵", "🍀", "🌳", "🍁", "🌖", "✨", "☀️", "❄️", "⛈️", "🍑", "🍎", "🍊", "🍐", "🍕", "🏀", "🎾", "🏐", "🌸", "🌼"]
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(3/4, contentMode: .fit)
                    }
                }
                .padding()
            }
            .foregroundColor(.blue)
            
            Spacer()
            
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.square")
                .font(.largeTitle)
                .padding(.horizontal)
        }
    }
    
    var remove: some View {
        Button {
            if emojiCount != 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.square")
                .font(.largeTitle)
                .padding(.horizontal)
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
