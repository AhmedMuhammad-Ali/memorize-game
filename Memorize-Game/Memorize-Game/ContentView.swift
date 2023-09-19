//
//  ContentView.swift
//  Memorize-Game
//
//  Created by Ahmed Ali on 13/09/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🤹🏻", "🧜🏻‍♂️", "🐣", "👨🏻‍🎤"]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    let content: String
    @State var isFacedUp = true
    
    var body: some View {
        ZStack {
            let roundedRectangle = RoundedRectangle(cornerRadius: 12.0)
            if isFacedUp {
                roundedRectangle.fill(.white)
                roundedRectangle.strokeBorder(lineWidth: 3.0)
                Text(content).font(.largeTitle)
            } else {
                roundedRectangle.fill()
            }
        }
        .onTapGesture {
            isFacedUp.toggle()
        }
    }
}
