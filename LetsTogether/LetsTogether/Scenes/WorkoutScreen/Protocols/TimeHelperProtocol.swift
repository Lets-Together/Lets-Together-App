//
//  TimeHelperProtocol.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 04/10/21.
//

import Foundation

protocol TimeHelperProtocol {
    func startTimer(actionForEachTimeUnit: @escaping () -> Void, didFinishedTimerAction: @escaping () -> Void)
    func pauseTimer()
    func stringTime() -> String
}
