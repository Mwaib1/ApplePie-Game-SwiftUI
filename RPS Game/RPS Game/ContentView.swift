//
//  ContentView.swift
//  RPS Game
//
//  Created by Mwai Banda   on 10/19/20.
//

import SwiftUI

struct ContentView: View {
    @State private var Win = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    VStack{
                        Text("Rock  Paper  Scissor")
                            .font(.system(.title, design: .rounded))
                            .bold()
                            .padding()
                    }
                    VStack{
                        Image("RSPLogo")
                            .resizable()
                            .frame(width: 300, height: 300, alignment: .center)
                        
                    }
                    
                    VStack{
                        NavigationLink(
                            destination: SelectView().navigationBarBackButtonHidden(true),
                            label: {
                                HStack{
                                    Image(systemName: "play.circle")
                                        .font(.title)
                                    Text("PLAY")
                                        .font(.system(.title, design: .rounded))
                                }
                                .frame(width: 160, height: 65, alignment: .center)
                                .background(Color(red: 86 / 255, green: 149 / 255, blue: 150 / 255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            })
                    }
                    Spacer()
                }
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
