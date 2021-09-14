//
//  InitialScreenViewController.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 14/09/21.
//

import Foundation
import UIKit
import AVFoundation
import AVKit

class InitialScreenViewController: UIViewController {

    let videoController = AVPlayerViewController()
    let videoPath = Bundle.main.path(forResource: "test", ofType: "MOV")!

    lazy var contentView: InitialScreen = {
            let view = InitialScreen()
            return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

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

    override func loadView() {
        view = contentView
    }

    func play() {
        if videoController.player?.timeControlStatus != AVPlayer.TimeControlStatus.playing {
            videoController.player?.play()
        }
    }

    func pause() {
        videoController.player?.pause()
    }

    @objc func reachTheEndOfTheVideo(_ notification: Notification) {
        videoController.player?.pause()
        videoController.player?.seek(to: CMTime.zero)
        videoController.player?.play()
    }

}
