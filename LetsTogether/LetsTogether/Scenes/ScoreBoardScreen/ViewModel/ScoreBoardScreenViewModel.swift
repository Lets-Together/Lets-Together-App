//
//  ScoreBoardScreenViewModel.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 29/09/21.
//

import Foundation
import CoreData

class ScoreBoardScreenViewModel {

    var userData = UserData()
    var coreDataManager = CoreDataManager()
    var exercise = Exercise()

    init() {

        // if is the first use
        if coreDataManager.getData() == nil {
            coreDataManager.saveData(currentScores: 0, attempts: 0)
        } else {
            self.getUserData()
        }
    }

    func getUserData() {
        userData.attempts = coreDataManager.getData()!.attempts
        userData.currentScores = coreDataManager.getData()!.currentScores
    }
}
