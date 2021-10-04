//
//  TimeHelper.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 15/09/21.
//

import Foundation

class TimeHelper: TimeHelperProtocol {
    
    var timer = Timer()
    var secondsCounter = 0
    private var secondsTimerAction: (() -> Void)?
    
    func startSecondsTimer(escaping action: @escaping () -> Void) {
        secondsTimerAction = action
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    @objc
    func fireTimer() {
        secondsCounter += 1
        secondsTimerAction?()
    }
    
    func stringTime() -> String {
        let time = secondsToHourMinutesAndSeconds()
        let timeString = secondsToTimeString(hours: time["hours"]!, minutes: time["minutes"]!, seconds: time["seconds"]!)
        return timeString
    }
    
    func secondsToHourMinutesAndSeconds() -> [String: Int] {
        var time = [String: Int]()
        if secondsCounter == 0 {
            time["seconds"] = 0
            time["minutes"] = 0
            time["hours"] = 0
        } else {
            time["seconds"] = (secondsCounter%3600)%60
            time["minutes"] = (secondsCounter%3600)/60
            time["hours"] = secondsCounter/3600
        }
        return time
    }
    
    func secondsToTimeString(hours: Int, minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += ":"
        timeString += String(format: "%02d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        return timeString
    }
}
