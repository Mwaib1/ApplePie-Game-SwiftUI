//
//  SelectView.swift
//  RPS Game
//
//  Created by Mwai Banda   on 10/19/20.
//

import SwiftUI

// RPS Game View
struct SelectView: View {
    @State var computerChoice = ""
    let moves: [String] = ["rock", "paper", "scissors"]
    
    @State private var activeImageIndex = 0
    @State private var _up = true
    @State private var startTimer = true
    @State private var showWinAlert = false
    @State private var showScore = false
    @State private var text = ""
    
    enum winningTest: String {
        case win = "You've Won"
        case loss = "You've Lost"
        case draw = "It's a Draw"
    }
    @ObservedObject var score = Score() 
    
    let timer = Timer.publish(every: 0.155, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            VStack{
                VStack{
                    if startTimer == false{
                        Text(text)
                            .font(.system(.title, design: .rounded))
                    } else {
                        Text("Rock  Paper  Scissor")
                            .font(.system(.title, design: .rounded))
                            .bold()
                    }
                    Text("\(self.score.Count) of 5" as String)
                        .padding(.top, 5)
                        .padding(.bottom, 15)
                }
                VStack{
                    // loop through all images
                    if startTimer {
                        Image(self.moves[self.activeImageIndex])
                            .resizable()
                            .frame(width: 300, height: 300, alignment: .center)
                            
                            
                            .onReceive(self.timer) { time in
                                if self.startTimer {
                                    if self.activeImageIndex < 3 && self._up {
                                        computerChoice =  self.moves[self.activeImageIndex]
                                        self.activeImageIndex += 1
                                        
                                        
                                        if self.activeImageIndex == 3 {
                                            self.activeImageIndex = 0
                                        }
                                    }
                                }
                            }
                    } else {
                        Image(computerChoice)
                            .resizable()
                            .frame(width: 300, height: 300, alignment: .center)
                        
                    }
                    
                }
                
                VStack{
                    Text("Select your choice:")
                        .font(.system(.headline, design: .rounded))
                        .padding()
                }
                HStack{
                    Button(
                        action: {
                            print(computerChoice)
                            self.checkWin(currentMove: "rock")
                            self.startTimer.toggle()
                            
                            // Pause the start game
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                                self.startTimer.toggle()
                            }
                        },
                        label: { Image("rock").resizable()
                            .frame(width: 90, height: 90) }
                    )
                    .padding(4)
                    
                    Button(
                        action: {
                            print(computerChoice)
                            self.checkWin(currentMove: "paper")
                            self.startTimer.toggle()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                                self.startTimer.toggle()
                            }
                        },
                        label: { Image("paper").resizable()
                            .frame(width: 90, height: 90) }
                    )
                    .padding(4)
                    
                    Button(
                        action: {
                            print(computerChoice)
                            self.checkWin(currentMove: "scissors")
                            self.startTimer.toggle()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                                self.startTimer.toggle()
                            }
                        },
                        label: { Image("scissors").resizable()
                            .frame(width: 90, height: 90) }
                    )
                    .padding(4)
                    
                }
                .padding(.bottom)
            }
            .padding(.bottom)
            .alert(isPresented: $showWinAlert, content: {
                Alert(title: Text("Game Over"), message: Text("The game is best 5/5 attempts press 'View Score' to see results."), primaryButton: .default(Text("Play Again"), action: {
                    // pause on popup
                    self.startTimer.toggle()
                    score.reset()
                    // resume
                    self.startTimer.toggle()
                    
                }), secondaryButton: .destructive(Text("Veiw Score"), action: {
                    self.showScore.toggle()
                    
                }))
            })
        }
        .fullScreenCover(isPresented: $showScore, content: { FullScreenScoreModalView.init(score: score) })
        Spacer()
    }
    // Switch Computer's choice
    func switchMove() {
        computerChoice = moves.randomElement() ?? ""
    }
    // Check if player has won
    func checkWin(currentMove: String){
        if currentMove == "rock" {
            if computerChoice == "paper" {
                print("You lose")
                text = winningTest.loss.rawValue
                score.losses += 1
            }
            else if computerChoice == "scissors" {
                print("you win")
                text = winningTest.win.rawValue
                score.wins += 1
            }
            else if currentMove == computerChoice{
                print("Draw")
                text = winningTest.draw.rawValue
                score.draws += 1
                
            }
        }
        if currentMove == "paper" {
            if computerChoice == "rock" {
                print("You win")
                text = winningTest.win.rawValue
                score.wins += 1
            }
            else if computerChoice == "scissors" {
                print("you lose")
                text = winningTest.loss.rawValue
                score.losses += 1
            }
            else if currentMove == computerChoice{
                print("Draw")
                text = winningTest.draw.rawValue
                score.draws += 1
            }
        }
        if currentMove == "scissors" {
            if computerChoice == "rock" {
                print("You lose")
                text = winningTest.loss.rawValue
                score.losses += 1
            }
            else if computerChoice == "paper" {
                print("you win")
                text = winningTest.win.rawValue
                score.wins += 1
            }
            else if currentMove == computerChoice{
                print("Draw")
                text = winningTest.draw.rawValue
                score.draws += 1
            }
            
        }
        // if count > 4 show score modal
        if score.Count > 4 {
            showWinAlert = true
        }
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
    }
}

