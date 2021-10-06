//
//  BodyPontuationHelper.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 21/09/21.
//

import Foundation
import Vision

class BodyPontuationHelper: BodyPontuationHelperProtocol {
    
    private(set) var currentPoints: Int = 0
    let pontuationUpdate: (Int) -> Void
    private var poses: [MLMultiArray] = [] {
        didSet {
            if(poses.count == 30) {
                classifyPose()
                poses = []
            }
        }
    }
    private(set) var movementName: String
    private(set) var movementPercetage: Double
    
    private let model: JumpingJacks_1 = {
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
        print(poses.count)
    }
    
    private func classifyPose() {
        let modelInput = MLMultiArray(concatenating: poses, axis: 0, dataType: .float)
        do {
            let prediction = try model.prediction(poses: modelInput)
            guard let jumpRopeProb = prediction.labelProbabilities[self.movementName] else { return }
            if jumpRopeProb >= self.movementPercetage {
                currentPoints += 100
                print("CONTEI PONTOS")
                DispatchQueue.main.async {
                    self.pontuationUpdate(self.currentPoints)
                }
            }
            print("\(prediction.label) - \(prediction.labelProbabilities[prediction.label]!)")
        } catch {
            print("erro")
        }
    }
}
