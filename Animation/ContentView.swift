//
//  ContentView.swift
//  Animation
//
//  Created by Seymen Özdeş on 21.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    let emojis: Array<String> = ["👻", "👁️", "🧝🏽‍♂️", "🧞"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .imageScale(.small).padding()
    }
}

struct CardView: View {
   @State var isFaceUp = true
   let content: String
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if(isFaceUp) {
                base.fill(.white)
                base.strokeBorder(lineWidth: 4.0)
                Text(content)
                    .font(.largeTitle)
            }
            else {
                base.fill(.orange)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}

