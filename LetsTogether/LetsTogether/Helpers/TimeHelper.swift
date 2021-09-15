//
//  TimeHelper.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 15/09/21.
//

import Foundation

class TimeHelper {
    
    var timer = Timer()
    
    func startSecondsTimer(escaping action: @escaping (TimeInterval) -> Void) {
        timer = Timer.init(timeInterval: 1, repeats: true) {t in
            action(t.timeInterval)
        }
    }
    
}
