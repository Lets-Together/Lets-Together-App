//
//  WorkoutScreen.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 13/09/21.
//

import Foundation
import UIKit

class WorkoutScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var cameraView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
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
        label.text = "0 0 : 0 0 : 0 0"
        label.font = UIFont.boldSystemFont(ofSize: 23)

        return label
    }()

    public func updateTimerLabel(strTime: String) {
        currentTime.text = strTime
    }
    
    public func updateScoreLabel(strScore: String) {
        currentScores.text = strScore
    }
    
    func setConstraints() {

        self.addSubview(cameraView)
        NSLayoutConstraint.activate([
            cameraView.leftAnchor.constraint(equalTo: self.leftAnchor),
            cameraView.rightAnchor.constraint(equalTo: self.rightAnchor),
            cameraView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cameraView.topAnchor.constraint(equalTo: self.topAnchor)
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
