//
//  BodyPontuationHelperProtocol.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 04/10/21.
//

import Foundation
import CoreML

protocol BodyPontuationHelperProtocol {
    var pontuationUpdate: (Int) -> Void { get }
    var currentPoints: Int { get }
    func add(pose: MLMultiArray)
}
