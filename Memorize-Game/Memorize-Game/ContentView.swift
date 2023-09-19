//
//  ContentView.swift
//  Memorize-Game
//
//  Created by Ahmed Ali on 13/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFacedUp: true)
            CardView()
            CardView()
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
    
    @State var isFacedUp = false
    var roundedRectangle = RoundedRectangle(cornerRadius: 12.0)
    
    var body: some View {
        ZStack {
            if isFacedUp {
                roundedRectangle.fill(.white)
                roundedRectangle.strokeBorder(lineWidth: 3.0)
                Text("🤹🏻").font(.largeTitle)
            } else {
                roundedRectangle.fill()
            }
        }
        .onTapGesture {
            isFacedUp.toggle()
        }
    }
}
