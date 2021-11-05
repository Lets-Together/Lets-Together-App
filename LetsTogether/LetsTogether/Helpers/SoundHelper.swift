//
//  SoundHelper.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 05/11/21.
//

import Foundation
import AVFoundation

final class SoundHelper: SoundHelperProtocol {
    
    let resourceName: String
    let fileExtension: String
    lazy var url = Bundle.main.url(forResource: resourceName, withExtension: fileExtension)
    var player: AVAudioPlayer?
    
    init(resourceName: String, fileExtension: String) {
        self.resourceName = resourceName
        self.fileExtension = fileExtension
    }
    
    func play() {
        guard let url = self.url else { return }
        try? AVAudioSession.sharedInstance().setCategory(.playback)
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
    
}
