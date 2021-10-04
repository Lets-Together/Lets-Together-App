//
//  WorkoutScreen.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 13/09/21.
//

import Foundation
import UIKit

class WorkoutScreen: UIView {

    var updatePoints: ((Int) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(updatePointsClosure: @escaping ((Int) -> Void)) {
        self.updatePoints = updatePointsClosure
    }

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
    
    let cameraPreview = WorkoutVideoViewController()
    
    func setConstraints() {
        let bodyPontuation = BodyPontuationHelper(movementName: "jumping-jack", percetage: 0.5) { points in
            let pointsStr = String(points)
            self.updatePoints?(points)
            self.updateScoreLabel(strScore: pointsStr)
        }
        
        cameraPreview.configure(bodyPontuation: bodyPontuation)
        self.addSubview(cameraPreview.view)
        cameraPreview.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cameraPreview.view.leftAnchor.constraint(equalTo: self.leftAnchor),
            cameraPreview.view.rightAnchor.constraint(equalTo: self.rightAnchor),
            cameraPreview.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cameraPreview.view.topAnchor.constraint(equalTo: self.topAnchor)
        ])

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
}
