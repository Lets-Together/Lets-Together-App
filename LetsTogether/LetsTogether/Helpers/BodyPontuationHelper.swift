//
//  BodyPontuationHelper.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 21/09/21.
//

import Foundation
import Vision

class BodyPontuationHelper {
    var pontuationCount: Int = 0 {
        didSet {
            print("Atualizei Pontos")
        }
    }
    var poses: [MLMultiArray] = [] {
        didSet {
            if(poses.count == 30) {
                classifyPose()
                poses = []
            }
        }
    }
    var movementName: String
    var movementPercetage: Double
    let pontuationUpdate: (Int) -> Void
    let model: JumpingJacks_1 = {
        do {
            let modelConfig = MLModelConfiguration()
            let classifier = try JumpingJacks_1(configuration: modelConfig)
            return classifier
        } catch {
            fatalError("Model error")
        }
    }()
    
    init(movementName: String, percetage: Double, pontuationUpdate: @escaping (Int) -> Void) {
        self.movementName = movementName
        movementPercetage = percetage
        self.pontuationUpdate = pontuationUpdate
    }
    
    func add(pose: MLMultiArray) {
        poses.append(pose)
    }
    
    func classifyPose() {
        let modelInput = MLMultiArray(concatenating: poses, axis: 0, dataType: .float)
        do {
            let prediction = try model.prediction(poses: modelInput)
            guard let jumpRopeProb = prediction.labelProbabilities[self.movementName] else { return }
            if jumpRopeProb >= self.movementPercetage {
                pontuationCount += 100
                print("CONTEI PONTOS")
                DispatchQueue.main.async {
                    self.pontuationUpdate(self.pontuationCount)
                }
            }
            print("\(prediction.label) - \(prediction.labelProbabilities[prediction.label]!)")
        } catch {
            print("erro")
        }
    }
}
