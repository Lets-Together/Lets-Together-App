//
//  InitialScreen.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 13/09/21.
//

import Foundation
import UIKit

class InitialScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var videoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Let's Together"
        label.font = UIFont.boldSystemFont(ofSize: 42)
        label.textColor = UIColor(red: 0.23, green: 0.05, blue: 0.05, alpha: 1.0)

        return label
    }()

    lazy var currentScoresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Current Scores"
        label.font = UIFont.boldSystemFont(ofSize: 24)

        return label
    }()

    lazy var currentScores: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00000"
        label.font = UIFont.systemFont(ofSize: 24)

        return label
    }()

    lazy var attemptsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Attempts"
        label.font = UIFont.boldSystemFont(ofSize: 24)

        return label
    }()

    lazy var attempts: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00"
        label.font = UIFont.systemFont(ofSize: 24)

        return label
    }()

    lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 1.0, green: 0.53, blue: 0.53, alpha: 1.0)
        button.setTitle("Start", for: .normal)
        button.layer.cornerRadius = 15

        return button
    }()

    func setConstraints() {

        self.addSubview(videoView)
        NSLayoutConstraint.activate([
            videoView.leftAnchor.constraint(equalTo: self.leftAnchor),
            videoView.rightAnchor.constraint(equalTo: self.rightAnchor),
            videoView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            videoView.topAnchor.constraint(equalTo: self.topAnchor)
        ])

        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 120)
        ])

        self.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            startButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.07),
            startButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            startButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)

        ])
    }
}
