//
//  ContentView.swift
//  Animation
//
//  Created by Seymen Özdeş on 21.09.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["😚", "😀", "🥲", "🥸", "🤩", "🥶", "😶‍🌫️", "🤫"]
    let animals: Array<String> = ["🐶", "🐱", "🐹", "🐷", "🐣", "🐨", "🦁", "🐼"]
    let food: Array<String> = ["🍏", "🍎", "🍐", "🍋", "🍌", "🍉", "🍑", "🥥"]
    @State var cardCount = 4
    @State var defaultTheme = themes.emojis
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.bold)
            ScrollView {
                cards
            }
            Spacer()
            
            cardCountAdjusters
        }
        .imageScale(.medium)
        .padding()
        
        // Theme's buttons
        VStack(spacing: 6) {
            Text("Themes")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.orange)
            
            Divider().frame(width: 240, height: 3)
                
            themeChangerButtons
        }
    }
    enum themes {
        case emojis, animals, food
    }
    func themeChangerAdjuster(name: String, theme: themes) -> some View { // tema değiştirme fonksiyonu
        Button(action: {
            defaultTheme = theme.self
        }, label: {
            Text(name)
        })
    }
    func cardCountAdjuster(by offSet: Int, symbol: String) -> some View { // kart sayım ayarlayıcı
        Button(action: {
                cardCount += offSet
        }, label: {
            Image(systemName: symbol)
        })
        // UI componenti belirli koşullarda etkisiz hale getirmemizi sağlar.
        .disabled(cardCount + offSet < 1 || cardCount + offSet > emojis.count)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                switch defaultTheme {
                case .emojis:
                    CardView(content: emojis[index])
                        .aspectRatio(2/3, contentMode: .fit) // IDK
                case .animals:
                    CardView(content: animals[index])
                        .aspectRatio(2/3, contentMode: .fit)
                case .food:
                    CardView(content: food[index])
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
        .foregroundColor(.orange)
    }
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "plus")
    }
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "minus")
    }
    var cardCountAdjusters: some View {
        HStack {
            cardAdder
            
            Spacer()
            
            cardRemover
        }
        .font(.title)
    }
    var animalThemeButton: some View {
        themeChangerAdjuster(name: "Animal", theme: themes.animals)
    }
    var foodsThemeButton: some View {
        themeChangerAdjuster(name: "Foods", theme: themes.food)
    }
    var emojisThemeButton: some View {
        themeChangerAdjuster(name: "Emojis", theme: themes.emojis)
    }
    var themeChangerButtons: some View {
        HStack(alignment: .center, spacing: 30) {
            animalThemeButton
            
            foodsThemeButton
            
            emojisThemeButton
        }
    }
}

struct CardView: View {
   @State var isFaceUp = true
   let content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 4.0)
                Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill(.orange).opacity(isFaceUp ? 0 : 1)
                
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

