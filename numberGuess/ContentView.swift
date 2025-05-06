//
//  ContentView.swift
//  numberGuess
//
//  Created by idriss cissoko on 5/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome, ").foregroundStyle(.blue).fontWeight(.bold).font(.title).fontDesign(.monospaced).padding(11)
            Text("I am guessRight, I use the binary search algorithm to guess the number you pick between 0 and 50, in up to 6 tries. up to the challenge ?").padding(.top, 5).padding(.bottom, 5).padding(.leading, 10).padding(.trailing, 10)
           

            
        }
        
    }
}

#Preview {
    ContentView()
}
