//
//  OnBoardingViewModel.swift
//  LetsTogether
//
//  Created by Gilberto Magno on 11/5/21.
//

import Foundation

class OnBoardingViewModel {

  
    func isFirstLaunch() -> Bool {
        return UserDefaults.isFirstLaunch
    }

}


extension UserDefaults {
    static var isFirstLaunch: Bool {
        get {
            return !UserDefaults.standard.bool(forKey:"isNewUser")
        }
        set {
            UserDefaults.standard.set(true, forKey:"isNewUser")
        }
    }
    static var isNotFirstLaunch: Bool {
        get{
            isFirstLaunch = true
            return isFirstLaunch
        }
        set{
            UserDefaults.standard.set(true, forKey: "isNewUser")
        }
    }

}
