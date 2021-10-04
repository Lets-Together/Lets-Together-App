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
    var coreDataManager = CoreDataManager()
    var delegate: WorkoutScreenViewModelDelegate?
    
    let bodyPose: BodyPoseHelperProtocol
    let bodyPontuation: BodyPontuationHelperProtocol
    let timer: TimeHelperProtocol
    
    init(bodyPose: BodyPoseHelperProtocol, bodyPontuation: BodyPontuationHelperProtocol, timer: TimeHelperProtocol) {
        self.bodyPose = bodyPose
        self.bodyPontuation = bodyPontuation
        self.timer = timer
    }
    
    func startTimer(action: @escaping (String) -> Void) {
        timerCounting = true
        timer.startTimer {
            let stringTime = self.timer.stringTime()
            action(stringTime)
        }
    }
    
    func pauseTimer() {
        timerCounting = false
        timer.pauseTimer()
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
