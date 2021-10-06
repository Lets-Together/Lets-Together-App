//
//  WorkoutScreenViewModel.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 15/09/21.
//

import Foundation
import AVFoundation

class WorkoutScreenViewModel: WorkoutViewModelProtocol {
    
    var score: Int = 0
    
    func addPoints(amount: Int) {
        score = amount
    }
  
    var timerCounting: Bool = true
    var coreDataManager = CoreDataManager()
    weak var delegate: WorkoutScreenViewModelDelegate?
    
    private let bodyPose: BodyPoseHelperProtocol
    private var bodyPontuation: BodyPontuationHelperProtocol
    private let timer: TimeHelperProtocol
    
    init(bodyPose: BodyPoseHelperProtocol, bodyPontuation: BodyPontuationHelperProtocol, timer: TimeHelperProtocol) {
        self.bodyPose = bodyPose
        self.bodyPontuation = bodyPontuation
        self.timer = timer
        self.bodyPontuation.pontuationUpdate = { points in
            self.score = points
            self.delegate?.pontuationUpdate(points: points)
        }
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
    
    func handleSample(sampleBuffer: CMSampleBuffer) {
        let bodyPoints = bodyPose.handle(sampleBuffer: sampleBuffer, orientation: .up)
        if(bodyPoints.1.shape == [1, 3, 18]) {
            bodyPontuation.add(pose: bodyPoints.1)
        }
    }

    func savePoints(points: Int16) {
        if coreDataManager.getData() == nil {
            coreDataManager.saveData(currentScores: points, attempts: 0)
        } else {
            coreDataManager.updateItem(dataId: coreDataManager.getData()!.objectID , currentScores: points, attempts: 0)
        }
    }
    
}
