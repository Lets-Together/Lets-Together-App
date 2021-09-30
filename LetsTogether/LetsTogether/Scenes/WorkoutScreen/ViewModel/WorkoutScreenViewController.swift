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
        contentView.quitButton.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
    }

    override func loadView() {
        view = contentView
    }
    
    func start() {
        workoutViewModel.startTimer { timeString in
            self.contentView.updateTimerLabel(strTime: timeString)
        }
    }

    @objc func buttonTapped(_ : UIButton) {
        let alert = UIAlertController(title: "Alert", message: "Do you really want to stop your activity?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive, handler: { _ in
            self.workoutViewModel.savePoints(points: Int16(self.workoutViewModel.score))
            let controller = ScoreBoardScreenViewController()
            controller.modalPresentationStyle = .fullScreen

            self.show(controller, sender: self)
        }))

        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { _ in
            self.start()
        }))

        self.present(alert, animated: true, completion: nil)
        self.workoutViewModel.pauseTimer()
    }

    func updatePoints(amount: Int) {
        workoutViewModel.addPoints(amount: amount)
        let currentScore = workoutViewModel.score
        let currentScoreStr = String(currentScore)
        contentView.updateScoreLabel(strScore: currentScoreStr)
    }
}
