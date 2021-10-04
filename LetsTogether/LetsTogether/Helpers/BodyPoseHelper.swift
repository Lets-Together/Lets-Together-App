//
//  BodyPoseHelper.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 21/09/21.
//

import Foundation
import Vision

class BodyPoseHelper: BodyPoseHelperProtocol {
    
    private let bodyPoseRequest: VNDetectHumanBodyPoseRequest = {
        let request = VNDetectHumanBodyPoseRequest()
        return request
    }()
    
    func handle( sampleBuffer: CMSampleBuffer, orientation: CGImagePropertyOrientation ) -> ([CGPoint], MLMultiArray) {
        let handler = VNImageRequestHandler(cmSampleBuffer: sampleBuffer, orientation: orientation, options: [:])
        do {
          try handler.perform([bodyPoseRequest])
        } catch {
          print("ERROR")
        }
        guard let bodyResults = bodyPoseRequest.results?.prefix(1) else { return ([], MLMultiArray())}
        let bodyRecognizedPoints = allRecognizedPoints(bodyResults: bodyResults)
        
        return (transformPointsToScreenPoints(bodyRecognizedPoints: bodyRecognizedPoints.0), bodyRecognizedPoints.1)
    }
    
    func allRecognizedPoints(bodyResults: Array<VNHumanBodyPoseObservation>.SubSequence) -> ([VNRecognizedPoint], MLMultiArray) {
        var bodyRecognizedPoints: [VNRecognizedPoint] = []
        var pose1: MLMultiArray = MLMultiArray()
        do {
            try bodyResults.forEach { observation in
                
                pose1 = try observation.keypointsMultiArray()
                let bodyParts = try observation.recognizedPoints(.all)
                bodyParts.forEach { item in
                    bodyRecognizedPoints.append(item.value)
                }
              }
        } catch {
            print("Erro")
        }
        
        return (bodyRecognizedPoints, pose1)
    }
    
    func transformPointsToScreenPoints(bodyRecognizedPoints: [VNRecognizedPoint]) -> [CGPoint] {
        return bodyRecognizedPoints.map {
            CGPoint(x: $0.location.x, y: 1 - $0.location.y)
        }
    }
    
}
