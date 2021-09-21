//
//  ScoreBoardScreenViewController.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 17/09/21.
//

import Foundation
import UIKit

class ScoreBoardScreenViewController: UIViewController {

    lazy var contentView: ScoreBoardScreen = {
            let view = ScoreBoardScreen()
            return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        view = contentView
    }
}
