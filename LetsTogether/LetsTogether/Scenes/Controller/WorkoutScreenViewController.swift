//
//  WorkoutScreenViewController.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 15/09/21.
//

import UIKit

class WorkoutScreenViewController: UIViewController {

    lazy var contentView: WorkoutScreen = {
        let view = WorkoutScreen()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testChronos()
    }

    override func loadView() {
        view = contentView
    }
    
    func testChronos() {
        let timerHandler = TimeHelper()
        timerHandler.startSecondsTimer {
            let stringTime = timerHandler.stringTime()
            self.contentView.updateTimerLabel(strTime: stringTime)
        }
    }

}
