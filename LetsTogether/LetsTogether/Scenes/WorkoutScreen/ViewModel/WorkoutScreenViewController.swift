//
//  WorkoutScreenViewController.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 15/09/21.
//

import UIKit

class WorkoutScreenViewController: UIViewController, WorkoutScreenViewModelDelegate, CanRotate {

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
        setIdleScreenTimer(to: true)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        setIdleScreenTimer(to: false)
    }

    override var shouldAutorotate: Bool {
        return true
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    override func loadView() {
        view = contentView
    }
    
    func start() {
        workoutViewModel.startTimer(
            action: { timeString in self.contentView.updateTimerLabel(strTime: timeString)
            },
            didFinishedTimerAction: { self.didFinishedTimer()}
            )
    }
    
    func setIdleScreenTimer(to update: Bool) {
        UIApplication.shared.isIdleTimerDisabled = update
    }

    @objc func buttonTapped(_ : UIButton) {
        let alert = UIAlertController(title: "End Training", message: "Are you sure you want to leave?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "End Training", style: UIAlertAction.Style.destructive, handler: { _ in
            self.workoutViewModel.savePoints(points: Int16(self.workoutViewModel.score))
            let controller = ScoreBoardScreenViewController(exercise: self.workoutViewModel.exercise)
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

    func didFinishedTimer() {
        let alert = UIAlertController(title: "Time Out", message: "The time has finished!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.destructive, handler: { _ in
            self.workoutViewModel.savePoints(points: Int16(self.workoutViewModel.score))
            let controller = ScoreBoardScreenViewController(exercise: self.workoutViewModel.exercise)
            controller.modalPresentationStyle = .fullScreen

            self.show(controller, sender: self)
        }))

        self.present(alert, animated: true, completion: nil)
        self.workoutViewModel.pauseTimer()
    }
}
