//
//  Score.swift
//  RPS Game
//
//  Created by Mwai Banda   on 10/19/20.
//

import SwiftUI

// Keep Score Between Views
class Score : ObservableObject {
    @Published var wins : Int
    @Published var draws : Int
    @Published var losses : Int
    init() {
        self.wins = 0
        self.draws = 0
        self.losses = 0
    }
    
    
    var Count : Int {
        get{
            return self.wins + self.draws + self.losses
        }
    }
    func reset() {
        self.wins = 0
        self.losses = 0
        self.draws = 0
    }
}
