//
//  ContentView.swift
//  SliderTest
//
//  Created by Adam Sadler on 3/25/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var testManager = TestManager()
    @State var currentValue: Double = 0
    
    var body: some View {
        VStack {
            Text("Please take this test")
                .padding()
                .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/)
                .font(.headline)
            Text("Current value: \(currentValue)")
                .dynamicTypeSize(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
            HStack {
                Spacer()
                Spacer()
                ZStack {
                    Capsule()
                        .fill(.gray)
                        .frame(width: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, height: 325.0)
                }
                Spacer()
                VStack {
                    Spacer()
                    Button(action: {
                        if currentValue != testManager.ticks.last {
                            currentValue = testManager.ticks[+1]
                        }
                    }) {
                        Image(systemName: "chevron.up")
                            .frame(width: 50.0, height: 50)
                            .background(Color.white)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.yellow)
                            .padding()
                            
                    }
                    .contentShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .frame(width: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    Button(action: {
                        currentValue = testManager.ticks[+1]
                    }) {
                        Image(systemName: "chevron.down")
                            .frame(width: 50.0, height: 50)
                            .background(Color.white)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.yellow)
                            .padding()
                    }
                    .contentShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .frame(width: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                Spacer()
            }
            .frame(width: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/, height: 350)
            Button("NEXT") {
                print(testManager.ticks)
            }
            .padding()
            .font(.headline)
            .foregroundColor(.black)
            .frame(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
            .background(Color.yellow)
            .clipShape(Capsule())
            
        }.onAppear {
            self.testManager.startTest()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
