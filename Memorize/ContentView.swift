//
//  ContentView.swift
//  Animation
//
//  Created by Seymen Özdeş on 21.09.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "👁️", "🧝🏽‍♂️", "🧞", "👻", "👁️", "🧝🏽‍♂️", "🧞"]
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            
            cardCountAdjusters
        }
        .imageScale(.medium)
        .padding()
    }
    func cardCountAdjuster(by offSet: Int, symbol: String) -> some View {
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
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit) // IDK
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

