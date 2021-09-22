//
//  WorkoutScreenViewController.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 15/09/21.
//

import UIKit

class WorkoutScreenViewController: UIViewController {

    let workoutViewModel: WorkoutViewModelProtocol
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(workoutViewModel: WorkoutViewModelProtocol) {
        self.workoutViewModel = workoutViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    lazy var contentView: WorkoutScreen = {
        let view = WorkoutScreen()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }

    override func loadView() {
        view = contentView
    }
    
    func start() {
        workoutViewModel.startTimer { timeString in
            self.contentView.updateTimerLabel(strTime: timeString)
        }
    }

    func updatePoints(amount: Int) {
        workoutViewModel.addPoints(amount: amount)
        let currentScore = workoutViewModel.score
        let currentScoreStr = String(currentScore)
        contentView.updateScoreLabel(strScore: currentScoreStr)
    }
}
