//
//  FullScreenScoreModalView.swift
//  RPS Game
//
//  Created by Mwai Banda   on 10/19/20.
//

import SwiftUI

// Score Modal
struct FullScreenScoreModalView : View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var score: Score
    
    var body: some View{
        VStack{
            Spacer()
            if score.wins > score.losses + score.draws{
                Text("You Win")
                    .bold()
                    .font(.system(.largeTitle, design: .rounded))
                    .padding()
            } else {
                Text("You've Lost")
                    .bold()
                    .font(.system(.largeTitle, design: .rounded))
                    .padding()
            }
            Text("Score")
                .font(.system(.headline, design: .rounded))
                .padding()
            Text("Wins: \(score.wins)")
                .font(.system(.subheadline, design: .rounded))
                .padding(1)
            Text("Draws: \(score.draws)")
                .font(.system(.subheadline, design: .rounded))
                .padding(1)
            Text("Losses: \(score.losses)")
                .font(.system(.subheadline, design: .rounded))
                .padding(1)
            Spacer()
            HStack{
                Image(systemName: "play.circle")
                    .font(.title)
                Text("PLAY AGAIN")
                    .font(.system(.title, design: .rounded))
            }
            .frame(width: 250, height: 65, alignment: .center)
            .background(Color(red: 86 / 255, green: 149 / 255, blue: 150 / 255))
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(. bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
            score.wins = 0
            score.draws = 0
            score.losses = 0
            
        }
    }
}


struct FullScreenScoreModalView_Previews: PreviewProvider {
    static var previews: some View {
        let score1 = Score()
        FullScreenScoreModalView(score: score1) 
    }
}
