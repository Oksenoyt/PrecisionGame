//
//  SwiftUIView.swift
//  PrecisionGame
//
//  Created by Elenka on 20.09.2022.
//

import SwiftUI

struct Slider: UIViewRepresentable {
    @Binding var value: Double
    
    func makeUIView(context: Context) -> UISlider {
        let view = UIView()
        
        let slider = UISlider(frame:CGRect(x: 0, y: 0, width: 300, height: 20))
        slider.center = view.center
        slider.maximumValue = 0.0
        slider.maximumValue = 100.0
        slider.value = 0.0
        
        slider.isContinuous = false
        slider.thumbTintColor = UIColor(red: 1, green: 0.9, blue: 0.8, alpha: 1.0)
    
        view.addSubview(slider)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueDidChange),
            for: .valueChanged)
        return slider
    }
    
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
}

extension Slider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func sliderValueDidChange(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
    
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        Slider(value: .constant(2.0))
    }
}
