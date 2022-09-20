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
    @State var thumbTintOpacity = 0.9 //не смогла передать в цвет бегунка
    
    var body: some View {
        VStack(spacing: 30.0) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                Slider(value: $currentValue, alphaValue: $thumbTintOpacity)
                    .onChange(of: currentValue) { newValue in
                        currentValue = newValue
                }
                Text("100")
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
        thumbTintOpacity = Double(difference / 100)
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
