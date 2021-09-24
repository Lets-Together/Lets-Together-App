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

    lazy var contentView: WorkoutScreen = {
            let view = WorkoutScreen()
            return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.quitButton.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped(_ : UIButton) {
        let controller = ScoreBoardScreenViewController()
        controller.modalPresentationStyle = .fullScreen
        self.show(controller, sender: self)
    }

    override func loadView() {
        view = contentView
    }
}
