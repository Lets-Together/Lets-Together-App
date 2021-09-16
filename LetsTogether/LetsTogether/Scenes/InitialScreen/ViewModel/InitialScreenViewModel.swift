//
//  InitialScreenViewModel.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 16/09/21.
//

import Foundation
import CoreData

class InitialScreenViewModel {
    
    var userData = UserData()
    var coreDataManager = CoreDataManager()

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
