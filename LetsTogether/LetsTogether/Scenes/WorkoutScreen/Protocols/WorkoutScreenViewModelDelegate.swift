//
//  WorkoutScreenViewModelDelegate.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 04/10/21.
//

import Foundation

protocol WorkoutScreenViewModelDelegate: AnyObject {
    func pontuationUpdate(points: Int)
    func didFinishedTimer()
}
