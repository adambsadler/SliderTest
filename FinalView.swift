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
                .padding()
            HStack {
                Spacer()
                Spacer()
                Text("Slider 1:")
                    .font(.headline)
                Spacer()
                Text(String(viewModel.firstTestIncrement))
                Spacer()
                Text(String(viewModel.firstTestSelection))
                Spacer()
                Spacer()
            }
            HStack {
                Spacer()
                Spacer()
                Text("Slider 2:")
                    .font(.headline)
                Spacer()
                Text(String(viewModel.secondTestIncrement))
                Spacer()
                Text(String(viewModel.secondTestSelection))
                Spacer()
                Spacer()
            }
            HStack {
                Spacer()
                Spacer()
                Text("Slider 3:")
                    .font(.headline)
                Spacer()
                Text(String(viewModel.thirdTestIncrement))
                Spacer()
                Text(String(viewModel.thirdTestSelection))
                Spacer()
                Spacer()
            }
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
        FinalView()
    }
}
