//
//  ContentView.swift
//  numberGuess
//
//  Created by idriss cissoko on 5/6/25.
//

import SwiftUI

struct ContentView: View {
    // Defining the overall variable using state
    @State private var currentGuessTries : Int = 0
    @State private var lowBound : Int = 0 // will be used as the basic of the binary search implementation
    @State private var highBound : Int = 50 // will be used as a higbound of the binary search
    @State private var currentGuessedNumber: Int? = nil
    @State private var isPlaying: Bool = false
    @State private var finalMessage: String = ""
    @State private var hasEnded :Bool = false

    // function to start the game
    func initGame(){
        currentGuessTries = 1
        lowBound = 0
        highBound = 50
        currentGuessedNumber = (highBound + lowBound) / 2
        isPlaying = true
        hasEnded = false
        finalMessage = "Current Number: \(currentGuessedNumber ?? 0) in number of tries: \(currentGuessTries)"
    }

    func resetGame(){
        currentGuessTries = 0
        lowBound = 0
        highBound = 50
        currentGuessedNumber = nil
        isPlaying = false
        finalMessage = ""
        hasEnded = false
    }

    // function to update the currentGuessed number
    func updateGuess(){
        // making sure program is still in the range
        if lowBound <= highBound {
            currentGuessTries += 1
            currentGuessedNumber = (highBound + lowBound) / 2
            finalMessage = "Current Number: \(currentGuessedNumber ?? 0) in number of tries: \(currentGuessTries)"
        } else {
            finalMessage = "I lost, I did not guess the number in \(currentGuessTries) tries"
            isPlaying = false
            hasEnded = true
        }
    }

    // function to low and higher
    func lowerButtonPressed(){
        if let guess = currentGuessedNumber {
            highBound = guess - 1
            updateGuess()
        }
    }

    func higherButtonPressed(){
        if let guess = currentGuessedNumber {
            lowBound = guess + 1
            updateGuess()
        }
    }

    func correctGuess(){
        finalMessage = "I guessed the number in \(currentGuessTries) tries"
        isPlaying = false
        hasEnded = true
    }

    // game display
    func gameDisplay() -> some View {
        VStack(spacing: 16) {
            if let guess = currentGuessedNumber {
                Text("Is your number \(guess)?").font(.title2)
                HStack {
                    Button("Too Low", action: higherButtonPressed)
                        .padding().background(.blue).foregroundColor(.white).cornerRadius(8)
                    Button("Correct", action: correctGuess)
                        .padding().background(.blue).foregroundColor(.white).cornerRadius(8)
                    Button("Too High", action: lowerButtonPressed)
                        .padding().background(.blue).foregroundColor(.white).cornerRadius(8)
                }
            }
        }
    }

    var body: some View {
        VStack (alignment: .leading, spacing: 16) {
            // welcome text and description
            Text("Welcome, ").foregroundStyle(.blue).fontWeight(.bold).font(.title).fontDesign(.monospaced).padding(11)
            Text("I am guessRight, I use the binary search algorithm to guess the integer number you pick between 0 and 50, in up to 6 tries. up to the challenge ?").padding(.top, 5).padding(.bottom, 5).padding(.leading, 10).padding(.trailing, 10)

            Button(action:{
                if !isPlaying {
                    initGame()
                } else {
                    resetGame()
                }
            }) {
                Text("Play")
            }
            .padding(10)
            .border(Color.blue, width: 1)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            if isPlaying {
                gameDisplay()
            }

            if !finalMessage.isEmpty {
                Text(finalMessage)
                    .padding(.top, 10)
                    .foregroundColor(.black)
                    .font(.body)
            }

            Spacer()
        }.padding(10)
    }
}

#Preview {
    ContentView()
}

