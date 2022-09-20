//
//  ContentView.swift
//  PrecisionGame
//
//  Created by Elenka on 20.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var alertPresented = false
    @State private var targetValue = Int.random(in: 0...100)
    @State var currentValue = 0.0
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            Slider(value: $currentValue)
                .onChange(of: currentValue) { newValue in
                    currentValue = newValue
                }
            Button("Проверь меня", action: {alertPresented = true})
                .alert("Wrong Format", isPresented: $alertPresented, actions: {}) {
                    Text(computeScore().formatted())
                }
            Button("Начать заного") {
                targetValue = Int.random(in: 0...100)
            }
        }.padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
