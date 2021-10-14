//
//  TabBarViewController.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 06/10/21.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = UIColor(red: 255/255, green: 107/255, blue: 106/255, alpha: 1)

        let item1 = ExercisesViewController()
        let icon1 = UITabBarItem(title: "Exercises", image: UIImage(systemName: "drop"), selectedImage: UIImage(systemName: "drop.fill"))
        item1.tabBarItem = icon1

        let item2 = InitialScreenViewController()
        let icon2 = UITabBarItem(title: "Game Center", image: UIImage(systemName: "list.number"), selectedImage: UIImage(systemName: "list.number"))
        item2.tabBarItem.badgeColor = .black
        item2.tabBarItem = icon2
        
        let controllers = [item1, item2]
        self.viewControllers = controllers
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true
    }
}
