//
//  OnBoardingViewController.swift
//  LetsTogether
//
//  Created by Gilberto Magno on 11/5/21.
//

import Foundation
import UIKit
import GameKit
import AVKit
import AVFoundation

class OnBoardingViewController: UIViewController {

    let viewModel = OnBoardingViewModel()

    lazy var contentView: OnBoardingView = {
        let view = OnBoardingView()
        return view
    }()
    let videoController = AVPlayerViewController()
    let videoPath = Bundle.main.path(forResource: "TutorialLetsTogether", ofType: "mov")!


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func loadView() {
        view = contentView
    }

    func setupUI() {
        backgroundVideoConfig()
        contentView.startButton.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        contentView.repeatButton.addTarget(self, action: #selector(self.repeatVideo), for: .touchUpInside)
    }

    @objc func buttonTapped(_ : UIButton) {
        let controller = ExercisesViewController()
        videoController.player?.pause()
        controller.modalPresentationStyle = .fullScreen
        self.show(controller, sender: self)
    }

    @objc func repeatVideo() {
        videoController.player?.seek(to: CMTime.zero)
        videoController.player?.play()
    }

    func backgroundVideoConfig() {
            videoController.player = AVPlayer(url: URL(fileURLWithPath: videoPath))

            contentView.videoView.addSubview(videoController.view)
            videoController.view.frame = contentView.videoView.frame
            videoController.view.alpha = 0.8

            videoController.showsPlaybackControls = false
            videoController.player?.isMuted = false
            videoController.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoController.player?.seek(to: CMTime.zero)
            NotificationCenter.default.addObserver(self, selector: #selector(reachTheEndOfTheVideo(_:)),
                                                   name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                   object: self.videoController.player?.currentItem)

            videoController.player?.play()
        }

        @objc func reachTheEndOfTheVideo(_ notification: Notification) {
            videoController.player?.pause()
         //   videoController.player?.seek(to: CMTime.zero)
        //    videoController.player?.play()
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
