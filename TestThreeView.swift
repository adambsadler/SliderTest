//
//  TestThreeView.swift
//  SliderTest
//
//  Created by Adam Sadler on 3/27/22.
//

import SwiftUI

struct TestThreeView: View {
    @EnvironmentObject var viewModel: TestViewModel

    @State var selection = 0.0
    @State var increment = 0
    @State var progress: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Text("Please take this THIRD test")
                .padding()
                .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/)
                .font(.headline)
            Text("Current value: \(selection)")
                .dynamicTypeSize(/*@START_MENU_TOKEN@*/.medium/*@END_MENU_TOKEN@*/)
            HStack {
                Spacer()
                Spacer()
                Spacer()
                ZStack(alignment: .bottom) {
                    Capsule()
                        .fill(.gray)
                        .frame(width: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, height: 325.0)
                        .opacity(/*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
                    Capsule()
                        .fill(.linearGradient(Gradient(colors: [.orange, .yellow]), startPoint: .bottom, endPoint: .top))
                        .frame(width: 25.0, height: min(CGFloat(progress) * 325.0, 325.0))
                        .opacity(0.75)
                        
//                    ZStack{
//                        Circle()
//                            .fill(.yellow)
//                            .frame(width: 50.0, height: 50.0)
//                            .offset(y: progress * -300.0)
//                            .opacity(0.25)
//                        Circle()
//                            .fill(.white)
//                            .frame(width: 25.0, height: 25.0)
//                            .offset(y: progress * -300.0)
//                    }
                    
                }.padding()
                Spacer()
                VStack {
                    Spacer()
                    Button(action: {
                        if increment < viewModel.ticks.count - 1{
                            selection = viewModel.ticks[increment + 1]
                            increment += 1
                            progress += 0.075
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
                        if increment <= viewModel.ticks.count - 1 && increment != 0{
                            selection = viewModel.ticks[increment - 1]
                            increment -= 1
                            progress -= 0.075
                        }
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
            
            NavigationLink(destination: FinalView()) {
                Text("NEXT")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                    .background(Color.yellow)
                    .clipShape(Capsule())
            }.simultaneousGesture(TapGesture().onEnded {
                viewModel.thirdTestIncrement = increment
                viewModel.thirdTestSelection = selection
                print(increment)
            })
        }
        .navigationBarHidden(true)
        .onAppear {
            selection = viewModel.ticks[0]
        }
    }
}

struct TestThreeView_Previews: PreviewProvider {
    static var previews: some View {
        TestThreeView()
    }
}
