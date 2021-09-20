//
//  WorkoutVideoViewController.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 20/09/21.
//

import UIKit
import AVFoundation
import Vision

class WorkoutVideoViewController: UIViewController {
    
    var count = 0
    var jumpsCount = 0
    var modelInput = MLMultiArray()
    var poses: [MLMultiArray] = []

    private var cameraFeedSession: AVCaptureSession?
    
    private let videoDataOutputQueue = DispatchQueue(
      label: "CameraFeedOutput",
      qos: .userInteractive
    )
    
    private let bodyPoseRequest: VNDetectHumanBodyPoseRequest = {
        let request = VNDetectHumanBodyPoseRequest()
        return request
    }()
    
    private var cameraView: CameraPreview { view as! CameraPreview }
    
    override func loadView() {
        view = CameraPreview()
    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
      
      do {
        // 1
        if cameraFeedSession == nil {
          // 2
          try setupAVSession()
          // 3
          cameraView.previewLayer.session = cameraFeedSession
          cameraView.previewLayer.videoGravity = .resizeAspectFill
        }
        
        // 4
        cameraFeedSession?.startRunning()
      } catch {
        print(error.localizedDescription)
      }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      cameraFeedSession?.stopRunning()
      super.viewWillDisappear(animated)
    }
    
    func setupAVSession() throws {
      // 1
      guard let videoDevice = AVCaptureDevice.default(
        .builtInWideAngleCamera,
        for: .video,
        position: .front)
      else {
//        throw AppError.captureSessionSetup(
//          reason: "Could not find a front facing camera."
//        )
        print("Erro 1")
        return
      }

      // 2
      guard
        let deviceInput = try? AVCaptureDeviceInput(device: videoDevice)
      else {
//        throw AppError.captureSessionSetup(
//          reason: "Could not create video device input."
//        )
        print("Erro 2")
        return
      }

      // 3
      let session = AVCaptureSession()
      session.beginConfiguration()
      session.sessionPreset = AVCaptureSession.Preset.high

      // 4
      guard session.canAddInput(deviceInput) else {
//        throw AppError.captureSessionSetup(
//          reason: "Could not add video device input to the session"
//        )
        print("Erro 3")
        return
      }
      session.addInput(deviceInput)

      // 5
      let dataOutput = AVCaptureVideoDataOutput()
      if session.canAddOutput(dataOutput) {
        session.addOutput(dataOutput)
        dataOutput.alwaysDiscardsLateVideoFrames = true
        dataOutput.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
      } else {
//        throw AppError.captureSessionSetup(
//          reason: "Could not add video data output to the session"
//        )
        print("Erro 4")
        return
      }
      
      // 6
      session.commitConfiguration()
      cameraFeedSession = session
    }
    
    var pointsProcessorHandler: (([CGPoint]) -> Void)?
    var jumpsCountHandler: ((Int) -> Void)?
    
    func processBodyPoints(_ bodyParts: [CGPoint]) {
        let convertedPoints = bodyParts.map {
            cameraView.previewLayer.layerPointConverted(fromCaptureDevicePoint: $0)
        }
        jumpsCountHandler?(jumpsCount)
        pointsProcessorHandler?(convertedPoints)
    }
}

extension
WorkoutVideoViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput(
      _ output: AVCaptureOutput,
      didOutput sampleBuffer: CMSampleBuffer,
      from connection: AVCaptureConnection
    ) {
//        var bodyPoints: [CGPoint] = []
        
//        defer {
//          DispatchQueue.main.sync {
//            self.processBodyPoints(bodyPoints)
//          }
//        }

      // 1
//      let handler = VNImageRequestHandler(
//        cmSampleBuffer: sampleBuffer,
//        orientation: .up,
//        options: [:]
//      )

//      do {
//        // 2
//        try handler.perform([bodyPoseRequest])
//
//        // 3
//        guard let bodyResults = bodyPoseRequest.results?.prefix(1)
//        else {
//          return
//        }
//
//        var bodyRecognizedPoints: [VNRecognizedPoint] = []
//
//        try bodyResults.forEach { observation in
//
//            let pose1 = try observation.keypointsMultiArray()
//
//            poses.append(pose1)
//
//            if poses.count >= 30 {
//
//                print(poses.count)
//
//                let modelInput = MLMultiArray(concatenating: poses, axis: 0, dataType: .float)
//
//                let jumpRopeClassifier = JumpingJacks_1()
//
//                let prediction = try jumpRopeClassifier.prediction(poses: modelInput)
//
//                guard let jumpRopeProb = prediction.labelProbabilities["jumping-jack"] else { return }
//
//                if jumpRopeProb >= 0.9 {
//                    jumpsCount = jumpsCount + 1
//                }
//
//                print("\(prediction.label) - \(prediction.labelProbabilities[prediction.label]!)")
//
//                poses = []
//            }
            
//            let bodyParts = try observation.recognizedPoints(.all)
//
//            if let leftElbow = bodyParts[.leftElbow] { bodyRecognizedPoints.append(leftElbow) }
//            if let rigthElbow = bodyParts[.rightElbow] { bodyRecognizedPoints.append(rigthElbow) }
//            if let mark3 = bodyParts[.leftAnkle] { bodyRecognizedPoints.append(mark3) }
//            if let mark4 = bodyParts[.leftEar] { bodyRecognizedPoints.append(mark4) }
//            if let mark5 = bodyParts[.rightWrist] { bodyRecognizedPoints.append(mark5) }
//            if let mark6 = bodyParts[.leftEye] { bodyRecognizedPoints.append(mark6) }
//            if let mark7 = bodyParts[.leftHip] { bodyRecognizedPoints.append(mark7) }
//            if let mark8 = bodyParts[.leftKnee] { bodyRecognizedPoints.append(mark8) }
//            if let mark9 = bodyParts[.leftShoulder] { bodyRecognizedPoints.append(mark9) }
//            if let mark10 = bodyParts[.leftWrist] { bodyRecognizedPoints.append(mark10) }
//            if let mark11 = bodyParts[.neck] { bodyRecognizedPoints.append(mark11) }
//            if let mark12 = bodyParts[.nose] { bodyRecognizedPoints.append(mark12) }
//            if let mark13 = bodyParts[.rightAnkle] { bodyRecognizedPoints.append(mark13) }
//            if let mark14 = bodyParts[.rightEar] { bodyRecognizedPoints.append(mark14) }
//            if let mark15 = bodyParts[.rightEye] { bodyRecognizedPoints.append(mark15) }
//            if let mark16 = bodyParts[.rightHip] { bodyRecognizedPoints.append(mark16) }
//            if let mark17 = bodyParts[.rightKnee] { bodyRecognizedPoints.append(mark17) }
//            if let mark18 = bodyParts[.rightShoulder] { bodyRecognizedPoints.append(mark18) }
//            if let mark19 = bodyParts[.root] { bodyRecognizedPoints.append(mark19) }
//        }
        
//        bodyPoints = bodyRecognizedPoints.map {
//            CGPoint(x: $0.location.x, y: 1 - $0.location.y)
//        }
//      } catch {
//        // 4
//        cameraFeedSession?.stopRunning()
//      }
    }
}
