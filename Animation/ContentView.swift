//
//  ContentView.swift
//  Animation
//
//  Created by Seymen Özdeş on 21.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
    }
}
struct CardView: View {
    var isFaceUp = false
    
    var body: some View {
        ZStack(content: {
            if(isFaceUp) {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 4.0)
                Text("👻")
                    .font(.largeTitle)
            }
            else {
                RoundedRectangle(cornerRadius: 12)
                    
            }
        })
    }
}

#Preview {
    ContentView()
}

