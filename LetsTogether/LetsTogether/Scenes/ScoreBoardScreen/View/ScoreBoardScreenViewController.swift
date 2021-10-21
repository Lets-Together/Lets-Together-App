//
//  ScoreBoardScreenViewController.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 17/09/21.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class ScoreBoardScreenViewController: UIViewController {

    let scoreBoardViewModel = ScoreBoardScreenViewModel()

    lazy var contentView: ScoreBoardScreen = {
        let view = ScoreBoardScreen()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.exitButton.addTarget(self, action: #selector(self.exitButtonTapped), for: .touchUpInside)
        contentView.restartButton.addTarget(self, action: #selector(self.repeatButtonTapped), for: .touchUpInside)
        contentView.scoresObtained.text = String(scoreBoardViewModel.coreDataManager.getData()!.currentScores)
    }

    override func loadView() {
        view = contentView
    }

    @objc func exitButtonTapped(_ : UIButton) {
        let controller = ExercisesViewController()
        controller.modalPresentationStyle = .fullScreen
        
        self.show(controller, sender: self)
    }

    @objc func repeatButtonTapped(_ : UIButton) {
        let bodyPontuatiion = BodyPontuationHelper(movementName: "jumping-jack", percetage: 0.8)
        let wksViewModel = WorkoutScreenViewModel(bodyPose: BodyPoseHelper(), bodyPontuation: bodyPontuatiion, timer: TimeHelper())
        let controller = WorkoutScreenViewController(workoutViewModel: wksViewModel)
        controller.modalPresentationStyle = .fullScreen
        self.show(controller, sender: self)
    }
}
