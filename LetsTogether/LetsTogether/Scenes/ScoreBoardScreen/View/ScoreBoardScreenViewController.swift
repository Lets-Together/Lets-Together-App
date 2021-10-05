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

    let videoController = AVPlayerViewController()
    let videoPath = Bundle.main.path(forResource: "test", ofType: "MOV")!

    lazy var contentView: ScoreBoardScreen = {
        let view = ScoreBoardScreen()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundVideoConfig()
        contentView.exitButton.addTarget(self, action: #selector(self.exitButtonTapped), for: .touchUpInside)
        contentView.repeatButton.addTarget(self, action: #selector(self.repeatButtonTapped), for: .touchUpInside)
        contentView.scoresObtained.text = String(scoreBoardViewModel.coreDataManager.getData()!.currentScores)
    }

    override func loadView() {
        view = contentView
    }

    @objc func exitButtonTapped(_ : UIButton) {
        let controller = InitialScreenViewController()
        controller.modalPresentationStyle = .fullScreen
        self.show(controller, sender: self)
    }

    @objc func repeatButtonTapped(_ : UIButton) {
        let bodyPontuatiion = BodyPontuationHelper(movementName: "jumping-jack", percetage: 0.8) { _ in }
        let wksViewModel = WorkoutScreenViewModel(bodyPose: BodyPoseHelper(), bodyPontuation: bodyPontuatiion, timer: TimeHelper())
        let controller = WorkoutScreenViewController(workoutViewModel: wksViewModel)
        controller.modalPresentationStyle = .fullScreen
        self.show(controller, sender: self)
    }

    func backgroundVideoConfig() {
        videoController.player = AVPlayer(url: URL(fileURLWithPath: videoPath))

        contentView.videoView.addSubview(videoController.view)
        videoController.view.frame = contentView.videoView.frame
        videoController.view.alpha = 0.8

        videoController.showsPlaybackControls = false
        videoController.player?.isMuted = true
        videoController.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoController.player?.seek(to: CMTime.zero)
        NotificationCenter.default.addObserver(self, selector: #selector(reachTheEndOfTheVideo(_:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: self.videoController.player?.currentItem)

        videoController.player?.play()
    }

    @objc func reachTheEndOfTheVideo(_ notification: Notification) {
        videoController.player?.pause()
        videoController.player?.seek(to: CMTime.zero)
        videoController.player?.play()
    }

    func play() {
        if videoController.player?.timeControlStatus != AVPlayer.TimeControlStatus.playing {
            videoController.player?.play()
        }
    }

    func pause() {
        videoController.player?.pause()
    }
}
