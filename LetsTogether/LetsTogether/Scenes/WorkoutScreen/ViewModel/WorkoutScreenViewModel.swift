//
//  WorkoutScreenViewModel.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 15/09/21.
//

import Foundation

class WorkoutScreenViewModel: WorkoutViewModelProtocol {
  
    var timerCounting: Bool = true
    var score: Int = 0
    let timerHandler = TimeHelper()
    var coreDataManager = CoreDataManager()
    var delegate: WorkoutScreenViewModelDelegate?
    
    func startTimer(action: @escaping (String) -> Void) {
        timerCounting = true
        timerHandler.startSecondsTimer {
            let stringTime = self.timerHandler.stringTime()
            action(stringTime)
        }
    }
    
    func pauseTimer() {
        timerCounting = false
        timerHandler.pauseTimer()
    }
    
    func addPoints(amount: Int) {
        score = amount
    }

    func savePoints(points: Int16) {
        if coreDataManager.getData() == nil {
            coreDataManager.saveData(currentScores: points, attempts: 0)
        } else {
            coreDataManager.updateItem(dataId: coreDataManager.getData()!.objectID , currentScores: points, attempts: 0)
        }
    }
    
}
