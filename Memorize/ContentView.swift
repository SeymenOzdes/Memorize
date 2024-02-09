//
//  ContentView.swift
//  Animation
//
//  Created by Seymen Özdeş on 21.09.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["😚", "😚", "😀", "😀", "🥲", "🥲", "🥸", "🤩", "🥶", "😶‍🌫️", "🥸"].shuffled()
    let animals: Array<String> = ["🐶", "🐶", "🐱", "🐱", "🐹", "🐹", "🦁", "🐣", "🐨", "🦁", "🐼"].shuffled()
    let food: Array<String> = ["🍏", "🍏", "🍎", "🍎", "🍐", "🍋", "🥥", "🍉", "🍉", "🍑", "🥥"].shuffled()
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
    func themeChanger(name: String, theme: themes, image: String) -> some View { // tema değiştirme fonksiyonu
        Button(action: {
            defaultTheme = theme.self
        }, label: {
            VStack {
                Image(systemName: image)
                    .font(.title)
                Text(name)
            }
        })
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
            ForEach(emojis.indices, id: \.self) { index in
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
   
    var animalThemeButton: some View {
        themeChanger(name: "Animals", theme: themes.animals, image: "dog.circle.fill")
    }
    var foodsThemeButton: some View {
        themeChanger(name: "Foods", theme: themes.food, image: "fork.knife.circle.fill")
    }
    var emojisThemeButton: some View {
        themeChanger(name: "Emojis", theme: themes.emojis, image: "figure.wave.circle.fill")
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
   @State var isFaceUp = false // default olarak kartlar kapalıdır.
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

