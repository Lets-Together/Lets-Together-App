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
        label.text = "Lets Together"
        label.font = UIFont.boldSystemFont(ofSize: 32)

        return label
    }()

    lazy var dataView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        view.alpha = 0.7

        return view
    }()

    lazy var currentScoresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Current Scores:"
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
        label.text = "Attempts:"
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
        button.backgroundColor = .systemBlue
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
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 80)
        ])

        self.addSubview(dataView)
        NSLayoutConstraint.activate([
            dataView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dataView.heightAnchor.constraint(equalToConstant: 100),
            dataView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            dataView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            dataView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 80)
        ])

        self.dataView.addSubview(currentScoresLabel)
        NSLayoutConstraint.activate([
            currentScoresLabel.leftAnchor.constraint(equalTo: self.dataView.leftAnchor, constant: 5),
            currentScoresLabel.topAnchor.constraint(equalTo: self.dataView.topAnchor, constant: 20)
        ])

        self.dataView.addSubview(currentScores)
        NSLayoutConstraint.activate([
            currentScores.leftAnchor.constraint(equalTo: self.currentScoresLabel.rightAnchor, constant: 5),
            currentScores.topAnchor.constraint(equalTo: self.dataView.topAnchor, constant: 20)
        ])

        self.dataView.addSubview(attemptsLabel)
        NSLayoutConstraint.activate([
            attemptsLabel.leftAnchor.constraint(equalTo: self.dataView.leftAnchor, constant: 5),
            attemptsLabel.topAnchor.constraint(equalTo: self.currentScoresLabel.bottomAnchor, constant: 5)
        ])

        self.dataView.addSubview(attempts)
        NSLayoutConstraint.activate([
            attempts.leftAnchor.constraint(equalTo: self.attemptsLabel.rightAnchor, constant: 2),
            attempts.topAnchor.constraint(equalTo: self.currentScoresLabel.bottomAnchor, constant: 5)
        ])

        self.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80),
            startButton.heightAnchor.constraint(equalToConstant: 40),
            startButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)
        ])
    }
}
