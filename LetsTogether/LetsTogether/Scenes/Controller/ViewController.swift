//
//  ViewController.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 13/09/21.
//

import UIKit

class ViewController: UIViewController {

    lazy var contentView: InitialScreen = {
            let view = InitialScreen()
            return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func loadView() {
            view = contentView
    }

}
