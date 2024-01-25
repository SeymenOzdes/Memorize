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
   @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if(isFaceUp) {
                base.fill(.white)
                base.strokeBorder(lineWidth: 4.0)
                Text("👻")
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

