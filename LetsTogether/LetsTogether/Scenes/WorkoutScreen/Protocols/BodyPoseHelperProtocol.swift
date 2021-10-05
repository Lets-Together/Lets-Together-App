//
//  BodyPoseHelperProtocol.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 04/10/21.
//

import Foundation
import Vision

protocol BodyPoseHelperProtocol {
    func handle( sampleBuffer: CMSampleBuffer, orientation: CGImagePropertyOrientation ) -> ([CGPoint], MLMultiArray)
}
