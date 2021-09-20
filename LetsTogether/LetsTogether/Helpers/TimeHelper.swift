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
        let timeString = secondsToTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        return timeString
    }
    
    func secondsToHourMinutesAndSeconds() -> (Int, Int, Int) {
        return (secondsCounter/3600, (secondsCounter%3600)/60, (secondsCounter%3600)%60)
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