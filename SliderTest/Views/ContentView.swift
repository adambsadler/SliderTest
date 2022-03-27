//
//  ContentView.swift
//  SliderTest
//
//  Created by Adam Sadler on 3/25/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: TestViewModel = TestViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                Text("Loading Test...")
                    .font(.headline)
                    .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/)
            } else if !viewModel.isLoading {
                TestOneView()
            }
        }
        .navigationBarHidden(true)
        .environmentObject(viewModel)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
