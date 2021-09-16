//
//  WorkoutScreenViewModel.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 15/09/21.
//

import Foundation

class WorkoutScreenViewModel {
    
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = true
    var score: Int = 0
    
    func startTimer() {
        timerCounting = true
    }
    
    func secondsToMinutesAndSecond() {
        
    }
}
