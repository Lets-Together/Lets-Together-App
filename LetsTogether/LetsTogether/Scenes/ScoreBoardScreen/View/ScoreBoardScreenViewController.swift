//
//  ScoreBoardScreenViewController.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 17/09/21.
//

import Foundation
import UIKit
import AVFoundation
import GameKit
class ScoreBoardScreenViewController: UIViewController {

    let scoreBoardViewModel = ScoreBoardScreenViewModel()

    lazy var contentView: ScoreBoardScreen = {
        let view = ScoreBoardScreen()
        return view
    }()

    init(exercise: Exercise) {
        scoreBoardViewModel.exercise = exercise
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.exitButton.addTarget(self, action: #selector(self.exitButtonTapped), for: .touchUpInside)
        contentView.restartButton.addTarget(self, action: #selector(self.repeatButtonTapped), for: .touchUpInside)
        contentView.scoresObtained.text = String(scoreBoardViewModel.coreDataManager.getData()!.currentScores)
        contentView.gameCenterButton.addTarget(self, action: #selector(self.showLeaderboard), for: .touchUpInside)
        contentView.titleLabel.text = scoreBoardViewModel.exercise.name
    }

    override func loadView() {
        view = contentView
    }

    @objc func exitButtonTapped(_ : UIButton) {
        let controller = ExercisesViewController()
        controller.modalPresentationStyle = .fullScreen
        self.show(controller, sender: self)
    }

    @objc func showLeaderboard(_ : UIButton) {
        let vc = GKGameCenterViewController(leaderboardID: scoreBoardViewModel.exercise.leaderboard!, playerScope: .global, timeScope: .allTime)
        vc.gameCenterDelegate = self
        present(vc, animated: true, completion: nil)
    }

    @objc func repeatButtonTapped(_ : UIButton) {
        let bodyPontuatiion = BodyPontuationHelper(movementName: self.scoreBoardViewModel.exercise.labelML!, percetage: 0.8)
        let wksViewModel = WorkoutScreenViewModel(bodyPose: BodyPoseHelper(), bodyPontuation: bodyPontuatiion,
                                                  timer: TimeHelper(timeToFinish: self.scoreBoardViewModel.exercise.time), exercise: scoreBoardViewModel.exercise)
        let controller = WorkoutScreenViewController(workoutViewModel: wksViewModel)
        controller.modalPresentationStyle = .fullScreen
        self.show(controller, sender: self)
    }
}

extension ScoreBoardScreenViewController: GKGameCenterControllerDelegate {
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        self.dismiss(animated: true, completion: nil)
    }
}
