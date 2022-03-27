//
//  FinalView.swift
//  SliderTest
//
//  Created by Adam Sadler on 3/27/22.
//

import SwiftUI

struct FinalView: View {
    @EnvironmentObject var viewModel: TestViewModel
    
    var body: some View {
        VStack {
            Text("Slider Results")
                .font(.title)
                .dynamicTypeSize(.xxxLarge)
                .padding()
            HStack {
                Spacer()
                Spacer()
                VStack {
                    Text("Slider 1:")
                        .font(.headline)
                    Text("Slider 2:")
                        .font(.headline)
                    Text("Slider 3:")
                        .font(.headline)
                }
                Spacer()
                VStack {
                    Text(String(viewModel.firstTestIncrement))
                    Text(String(viewModel.secondTestIncrement))
                    Text(String(viewModel.thirdTestIncrement))
                }
                Spacer()
                VStack {
                    Text(String(viewModel.firstTestSelection))
                    Text(String(viewModel.secondTestSelection))
                    Text(String(viewModel.thirdTestSelection))
                }
                Spacer()
                Spacer()
            }.padding(.bottom)
            NavigationLink(destination: ContentView()) {
                Text("START OVER")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                    .background(Color.yellow)
                    .clipShape(Capsule())
            }
        }
        .navigationBarHidden(true)
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView().environmentObject(TestViewModel())
    }
}
