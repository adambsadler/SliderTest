//
//  ContentView.swift
//  SliderTest
//
//  Created by Adam Sadler on 3/25/22.
//

import SwiftUI

struct ContentView: View {
    @State var sliderValue: Double = 0
    var testManager = TestManager()
    var body: some View {
        
        VStack {
            Text("Please take this test")
                .padding()
                .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/)
                .font(.headline)
            Text("Current value: \(sliderValue)")
                .dynamicTypeSize(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
            HStack {
                Slider(value: $sliderValue, in: -100...100)
                    .padding()
                    .frame(height: 400.0)
                    .rotationEffect(.degrees(-90))
                    
            }
            Button("Next") {
                self.testManager.startTest()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
