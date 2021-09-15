//
//  TimeHelper.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 15/09/21.
//

import Foundation

class TimeHelper {
    
    var timer = Timer()
    var secondsCounter = 0
    
    func startSecondsTimer(escaping action: @escaping (TimeInterval) -> Void) {
        timer = Timer.init(timeInterval: 1, repeats: true) {t in
            self.secondsCounter += 1
            action(t.timeInterval)
        }
    }
    
    func secondsToHourMinutesAndSeconds() -> (Int, Int, Int) {
        return (secondsCounter/3600, (secondsCounter%3600), (secondsCounter%3600) )
    }
}
