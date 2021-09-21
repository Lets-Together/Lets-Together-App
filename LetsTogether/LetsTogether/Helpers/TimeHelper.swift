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
        let timeString = secondsToTimeString(hours: time["hours"] ?? 0, minutes: time["minutes"] ?? 0, seconds: time["seconds"] ?? 0)
        return timeString
    }
    
    func secondsToHourMinutesAndSeconds() -> [String: Int] {
        var time = [String: Int]()
        time["seconds"] = (secondsCounter%3600)%60
        time["minutes"] = (secondsCounter%3600)/60
        time["hours"] = secondsCounter/3600
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