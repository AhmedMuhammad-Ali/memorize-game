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
    var isFacedUp: Bool = false
    var body: some View {
        ZStack {
            if isFacedUp {
                RoundedRectangle(cornerRadius: 12.0)
                    .strokeBorder(lineWidth: 3.0)
                Text("🤹🏻")
            } else {
                RoundedRectangle(cornerRadius: 12.0)
            }
        }
    }
}
