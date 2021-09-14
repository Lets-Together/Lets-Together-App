//
//  ViewController.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 13/09/21.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    lazy var contentView: InitialScreen = {
            let view = InitialScreen()
            return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        view = contentView
    }
}
