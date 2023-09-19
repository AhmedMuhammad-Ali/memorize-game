//
//  GridView.swift
//  Memorize-Game
//
//  Created by Ahmed Ali on 19/09/2023.
//

import SwiftUI

/// initial start with grids
struct GridView: View {
    var body: some View {
        Grid {
            GridRow {
                Text("Row 1")
                ForEach(0..<2) { _ in Color.red.frame(height: 60) }
            }
            GridRow {
                Text("Row 2")
                ForEach(0..<5) { _ in Color.green.frame(height: 60) }
            }
            GridRow {
                Text("Row 3")
                ForEach(0..<4) { _ in Color.blue.frame(height: 60) }
            }
            Spacer()
        }.padding()
    }
}
struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
