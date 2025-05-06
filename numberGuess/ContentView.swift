//
//  ContentView.swift
//  numberGuess
//
//  Created by idriss cissoko on 5/6/25.
//

import SwiftUI




struct ContentView: View {
    // Defining the overall variable using state
    @State private var currentGuess : Int = 0
    @State private var lowBound : Int = 0 // will be used as the basic of the binary search implementation
    @State private var highBound : Int = 50 // will be used as a higbound of the binary search
    @State private var currentGuessedNumber: Int? = nil
    @State private var isPlaying: Bool = false
    @State private var finalMessage: String = ""
    var body: some View {
        
        VStack (alignment: .leading, spacing: 16){
            // welcome text and description
            Text("Welcome, ").foregroundStyle(.blue).fontWeight(.bold).font(.title).fontDesign(.monospaced).padding(11)
            Text("I am guessRight, I use the binary search algorithm to guess the integer number you pick between 0 and 50, in up to 6 tries. up to the challenge ?").padding(.top, 5).padding(.bottom, 5).padding(.leading, 10).padding(.trailing, 10)
        
            Button(action:{
                print( "You pressed the button")
            }){Text("Play")}.padding( 10).border(Color.blue, width: 1).background(Color.blue).foregroundColor(.white)
            Spacer()
        }.padding(10)
        
    }
}

#Preview {
    ContentView()
}
