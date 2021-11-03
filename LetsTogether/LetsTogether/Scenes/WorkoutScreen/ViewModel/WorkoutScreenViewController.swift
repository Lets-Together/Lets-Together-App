//
//  WorkoutScreenViewController.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 15/09/21.
//

import UIKit

class WorkoutScreenViewController: UIViewController, WorkoutScreenViewModelDelegate {

    var workoutViewModel: WorkoutViewModelProtocol
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(workoutViewModel: WorkoutViewModelProtocol) {
        self.workoutViewModel = workoutViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    lazy var contentView: WorkoutScreen = {
        let view = WorkoutScreen()
        view.configure(handleSample: workoutViewModel.handleSample(sampleBuffer:))
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        workoutViewModel.delegate = self
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
        let alert = UIAlertController(title: "End Training", message: "Are you sure you want to leave?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "End Training", style: UIAlertAction.Style.destructive, handler: { _ in
            self.workoutViewModel.savePoints(points: Int16(self.workoutViewModel.score))
            let controller = ScoreBoardScreenViewController()
            controller.modalPresentationStyle = .fullScreen

            self.show(controller, sender: self)
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            self.start()
        }))

        self.present(alert, animated: true, completion: nil)
        self.workoutViewModel.pauseTimer()
    }

    func updatePoints(_ points: Int) {
        if let v = self.view as? WorkoutScreen {
            v.updateScoreLabel(strScore: String(points))
        }
    }
}

extension WorkoutScreenViewController {

    func pontuationUpdate(points: Int) {
        updatePoints(points)
    }
    
}
