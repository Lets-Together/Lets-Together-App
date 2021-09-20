//
//  WorkoutScreenViewModel.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 15/09/21.
//

import Foundation

protocol WorkoutViewModelProtocol {
    var timerCounting: Bool {get}
    var score: Int {get}
    func startTimer(action: @escaping (String) -> Void)
    func pauseTimer()
    func addPoints(amount: Int)
}

class WorkoutScreenViewModel: WorkoutViewModelProtocol {
  
    var timerCounting: Bool = true
    var score: Int = 0
    let timerHandler = TimeHelper()
    
    func startTimer(action: @escaping (String) -> Void) {
        timerCounting = true
        timerHandler.startSecondsTimer {
            let stringTime = self.timerHandler.stringTime()
            self.addPoints(amount: 10)
            action(stringTime)
        }
    }
    
    func pauseTimer() {
        timerCounting = false
        timerHandler.pauseTimer()
    }
    
    func addPoints(amount: Int) {
        score += amount
    }
    
}
