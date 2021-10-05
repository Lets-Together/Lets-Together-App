//
//  WorkoutViewModelProtocol.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 04/10/21.
//

import Foundation
import AVFoundation

protocol WorkoutViewModelProtocol {
    var timerCounting: Bool {get}
    var score: Int {get}
    func startTimer(action: @escaping (String) -> Void)
    func pauseTimer()
    func addPoints(amount: Int)
    func savePoints(points: Int16)
    func handleSample(sampleBuffer: CMSampleBuffer)
}
