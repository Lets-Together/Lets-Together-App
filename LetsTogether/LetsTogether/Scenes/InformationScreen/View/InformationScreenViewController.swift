//
//  InformationScreenViewController.swift
//  LetsTogether
//
//  Created by Gilberto Magno on 9/22/21.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class InformationScreenViewController: UIViewController {




        let initialScreenViewModel = InitialScreenViewModel()

        let videoController = AVPlayerViewController()
        let videoPath = Bundle.main.path(forResource: "test", ofType: "MOV")!

        lazy var contentView: InformationScreenView = {
                let view = InformationScreenView()
                return view
        }()

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
        }

        @objc func buttonTapped(_ : UIButton) {
            let controller = ViewController()
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
