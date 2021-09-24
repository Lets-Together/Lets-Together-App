//
//  WorkoutVideoViewController.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 20/09/21.
//

import UIKit
import AVFoundation

enum CameraError: Error {
    case noFrontCameraDetected(String)
    case inputCreation(String)
    case videoAdd(String)
    case videoData(String)
}

class WorkoutVideoViewController: UIViewController {
    
    //Captura do video
    private var cameraFeedSession: AVCaptureSession?
    var bodyPontuation: BodyPontuationHelper?
    
    func configure(bodyPontuation: BodyPontuationHelper) {
        self.bodyPontuation = bodyPontuation
    }
    
    //queue camera
    private let videoDataOutputQueue = DispatchQueue(
        label: "CameraFeedOutput",
        qos: .userInteractive
    )
    //Objeto de Preview da Camera
    private var cameraView: CameraPreview {
        guard let v = view as? CameraPreview else { return CameraPreview() }
        return v
    }
    
    override func loadView() {
        view = CameraPreview()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        do {
            if cameraFeedSession == nil {
                try setupAVSession()
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
}

extension
WorkoutVideoViewController: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput( _ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        let bodyPosesHelper = BodyPoseHelper()
        let bodyPoints = bodyPosesHelper.handle(sampleBuffer: sampleBuffer, orientation: .up)
        if(bodyPoints.1.shape == [1, 3, 18]) {
            bodyPontuation?.add(pose: bodyPoints.1)
        }
    }
}
