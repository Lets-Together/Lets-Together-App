//
//  WorkoutScreen.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 13/09/21.
//

import Foundation
import UIKit
import Vision

class WorkoutScreen: UIView {

    var videoViewController: WorkoutVideoViewController?
    var handleSample: ((CMSampleBuffer) -> Void)?
    let cameraPreview = WorkoutVideoViewController()
    var counter = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }

    func delayTime() {
        setCountdownConstraints()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
        //    self.workoutViewModel.pauseTimer()
            self.counter += 1
            self.countDownLabel.text = "\(5 - self.counter)"
            if self.counter == 5 {
                self.backgroundColor = .white
               // self.controll
                self.countDownLabel.removeFromSuperview()
                self.setConstraints()
            timer.invalidate()
            }
        })
    }

    func configure(handleSample: @escaping ((CMSampleBuffer) -> Void)) {
        self.handleSample = handleSample
        delayTime()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var countDownLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(5 - counter)"
        label.font = UIFont.boldSystemFont(ofSize: 43)

        return label
    }()

    lazy var scoresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Scores:"
        label.font = UIFont.boldSystemFont(ofSize: 23)

        return label
    }()

    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Time:"
        label.font = UIFont.boldSystemFont(ofSize: 23)

        return label
    }()

    lazy var currentScores: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00"
        label.font = UIFont.boldSystemFont(ofSize: 23)

        return label
    }()

    lazy var currentTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00:00"
        label.font = UIFont.boldSystemFont(ofSize: 23)

        return label
    }()

    lazy var quitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 1.0, green: 0.53, blue: 0.53, alpha: 1.0)
        button.setTitle("Quit", for: .normal)
        button.layer.cornerRadius = 15

        return button
    }()

    public func updateTimerLabel(strTime: String) {
        currentTime.text = strTime
    }

    public func updateScoreLabel(strScore: String) {
        currentScores.text = strScore
    }

    private func addCameraPreview(preview: WorkoutVideoViewController) {
        self.addSubview(preview.view)
        preview.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            preview.view.leftAnchor.constraint(equalTo: self.leftAnchor),
            preview.view.rightAnchor.constraint(equalTo: self.rightAnchor),
            preview.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            preview.view.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }

    private func setConstraints() {
        cameraPreview.handleSample = self.handleSample
        addCameraPreview(preview: cameraPreview)
        self.addSubview(quitButton)
        NSLayoutConstraint.activate([
            quitButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            quitButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            quitButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2)
        ])

        self.addSubview(scoresLabel)
        NSLayoutConstraint.activate([
            scoresLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18),
            scoresLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 80)
        ])

        self.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18),
            timeLabel.topAnchor.constraint(equalTo: self.scoresLabel.bottomAnchor, constant: 3)
        ])

        self.addSubview(currentScores)
        NSLayoutConstraint.activate([
            currentScores.leftAnchor.constraint(equalTo: self.scoresLabel.rightAnchor, constant: 3),
            currentScores.centerYAnchor.constraint(equalTo: self.scoresLabel.centerYAnchor)
        ])

        self.addSubview(currentTime)
        NSLayoutConstraint.activate([
            currentTime.leftAnchor.constraint(equalTo: self.timeLabel.rightAnchor, constant: 3),
            currentTime.centerYAnchor.constraint(equalTo: self.timeLabel.centerYAnchor)
        ])
    }

    private func setCountdownConstraints() {
        self.addSubview(countDownLabel)
        NSLayoutConstraint.activate([
            countDownLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            countDownLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])

    }
}
