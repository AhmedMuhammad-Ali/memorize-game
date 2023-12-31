//
//  ContentView.swift
//  Memorize-Game
//
//  Created by Ahmed Ali on 13/09/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🤹🏻", "🧜🏻‍♂️", "🐣", "👨🏻‍🎤", "🐘", "🧀", "🍿"]
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            Text("Memorize🏅").font(.largeTitle).fontWeight(.bold)
            ScrollView {
                cards
            }.scrollIndicators(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/, axes: [.vertical])
            Spacer()
               
            cardCountAdjusters
        }
        .padding()
    }
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(1, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
            
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjusters(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }) {
            Image(systemName: symbol)
        }.disabled(cardCount + offset > emojis.count || cardCount + offset < 1)
    }
    
    var cardRemover: some View {
        cardCountAdjusters(by: -1, symbol: "minus.circle.fill")
    }
    var cardAdder: some View {
        cardCountAdjusters(by: +1, symbol: "plus.circle.fill")
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
            Group {
                roundedRectangle.fill(.white)
                roundedRectangle.strokeBorder(lineWidth: 3.0)
                Text(content).font(.largeTitle)
            }
            .opacity(isFacedUp ? 1 : 0)
            roundedRectangle.fill().opacity(isFacedUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFacedUp.toggle()
        }
    }
}
