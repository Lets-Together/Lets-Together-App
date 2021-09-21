//
//  WorkoutVideoViewController.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 20/09/21.
//

import UIKit
import AVFoundation
import Vision

enum CameraError: Error {
    case noFrontCameraDetected(String)
    case inputCreation(String)
    case videoAdd(String)
    case videoData(String)
}

class WorkoutVideoViewController: UIViewController {
    
    //Contador de movimentos
    var jumpsCount = 0
    //Armazenagem de coordenadas do corpo por frame
    var poses: [MLMultiArray] = []
    //Captura do video
    private var cameraFeedSession: AVCaptureSession?
    //queue camera
    private let videoDataOutputQueue = DispatchQueue(
      label: "CameraFeedOutput",
      qos: .userInteractive
    )
    //Objeto que fará a deteccao do tipo de movimento
    //todo: mover para outro arquivo
    private let bodyPoseRequest: VNDetectHumanBodyPoseRequest = {
        let request = VNDetectHumanBodyPoseRequest()
        return request
    }()
    //Objeto de Preview da Camera
    private var cameraView: CameraPreview {
        guard let v = view as? CameraPreview else { return CameraPreview() }
        return v
    }
    
    //Closure que irá receber os pontos vistos e exibir na tela
    // Todo: Mover para outro arquivo
    var pointsProcessorHandler: (([CGPoint]) -> Void)?
    //Closure que vai receber a quantidade atual de movimentos e mostrar na tela
    //Todo: refazer de outra forma
    var jumpsCountHandler: ((Int) -> Void)?
    
    // 1
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
    
    // Configuracao da Captura
    func setupAVSession() throws {
        let videoDevice = try configureVideoDevice()
        let deviceInput = try configureDeviceInput(device: videoDevice)
        let session = try configureCaptureSession(deviceInput: deviceInput)
        cameraFeedSession = session
    }
    
    func configureVideoDevice() throws -> AVCaptureDevice {
        guard let videoDevice = AVCaptureDevice.default(
          .builtInWideAngleCamera,
          for: .video,
          position: .front)
        else {
          throw CameraError.noFrontCameraDetected("Camera frontal não encontrada")
        }
        return videoDevice
    }
    
    func configureDeviceInput(device: AVCaptureDevice) throws -> AVCaptureDeviceInput {
        guard let deviceInput = try? AVCaptureDeviceInput(device: device)
        else {
          throw CameraError.inputCreation("Could not create video device input.")
        }
        return deviceInput
    }
    
    func configureCaptureSession(deviceInput: AVCaptureDeviceInput) throws -> AVCaptureSession {
        let session = AVCaptureSession()
        session.beginConfiguration()
        session.sessionPreset = AVCaptureSession.Preset.high
        guard session.canAddInput(deviceInput) else {
          throw CameraError.videoAdd("Could not add video device input to the session")
        }
        session.addInput(deviceInput)
        let dataOutput = AVCaptureVideoDataOutput()
        if session.canAddOutput(dataOutput) {
          session.addOutput(dataOutput)
          dataOutput.alwaysDiscardsLateVideoFrames = true
          dataOutput.setSampleBufferDelegate(self, queue: videoDataOutputQueue)
        } else {
          throw CameraError.videoData("Could not add video data output to the session")
        }
        session.commitConfiguration()
        return session
    }
    
    // Funcao para processar os pontos do corpo detectados
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
