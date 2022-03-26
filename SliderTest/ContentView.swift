//
//  ContentView.swift
//  SliderTest
//
//  Created by Adam Sadler on 3/25/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var testManager = TestManager()
    
    var body: some View {
        if testManager.isLoading {
            Text("Loading Test...")
                .font(.headline)
                .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/)
        }
        else if !testManager.isLoading {
            TestOneView(ticks: testManager.ticks)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
