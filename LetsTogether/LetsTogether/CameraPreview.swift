//
//  CameraPreview.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 20/09/21.
//

import UIKit
import AVFoundation

class CameraPreview: UIView {

    override class var layerClass: AnyClass {
      AVCaptureVideoPreviewLayer.self
    }
    
    var previewLayer: AVCaptureVideoPreviewLayer {
        guard let l = layer as? AVCaptureVideoPreviewLayer else { return AVCaptureVideoPreviewLayer() }
        return l
    }
}
