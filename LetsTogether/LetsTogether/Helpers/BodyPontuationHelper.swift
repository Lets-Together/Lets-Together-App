//
//  BodyPontuationHelper.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 21/09/21.
//

import Foundation
import Vision

class BodyPontuationHelper {
    var count: Int = 0
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
    let model: JumpingJacks_1 = {
        do {
            let modelConfig = MLModelConfiguration()
            let classifier = try JumpingJacks_1(configuration: modelConfig)
            return classifier
        } catch {
            fatalError("Model error")
        }
    }()
    
    init(movementName: String, percetage: Double) {
        self.movementName = movementName
        movementPercetage = percetage
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
                count += 1
            }
            print("\(prediction.label) - \(prediction.labelProbabilities[prediction.label]!)")
        } catch {
            print("erro")
        }
    }
}
