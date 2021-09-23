//
//  ScoreBoard.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 17/09/21.
//

import Foundation
import UIKit

class ScoreBoardScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Keep Going!"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = UIColor(red: 1.0, green: 0.53, blue: 0.53, alpha: 1.0)

        return label
    }()

    lazy var videoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var infoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        view.alpha = 0.7

        return view
    }()

    lazy var titleScoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your Score"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = UIColor(red: 0.23, green: 0.05, blue: 0.05, alpha: 1.0)

        return label
    }()

    lazy var scoresObtained: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1340"
        label.font = UIFont.boldSystemFont(ofSize: 55)
        label.textColor = UIColor(red: 0.23, green: 0.05, blue: 0.05, alpha: 1.0)

        return label
    }()

    lazy var repeatButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Repeat", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(red: 1.0, green: 0.53, blue: 0.53, alpha: 1.0)

        return button
    }()

    lazy var exitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("Exit", for: .normal)
        button.setTitleColor(UIColor(red: 1.0, green: 0.53, blue: 0.53, alpha: 1.0), for: .normal)
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

        self.infoView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.infoView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.infoView.topAnchor, constant: 10)
        ])

        self.addSubview(infoView)
        NSLayoutConstraint.activate([
            infoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infoView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            infoView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            infoView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            infoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60)
        ])

        self.infoView.addSubview(scoresObtained)
        NSLayoutConstraint.activate([
            scoresObtained.centerXAnchor.constraint(equalTo: self.infoView.centerXAnchor),
            scoresObtained.centerYAnchor.constraint(equalTo: self.infoView.centerYAnchor)
        ])

        self.infoView.addSubview(titleScoreLabel)
        NSLayoutConstraint.activate([
            titleScoreLabel.centerXAnchor.constraint(equalTo: self.infoView.centerXAnchor),
            titleScoreLabel.bottomAnchor.constraint(equalTo: self.scoresObtained.topAnchor, constant: -30)
        ])

        self.addSubview(repeatButton)
        NSLayoutConstraint.activate([
            repeatButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            repeatButton.topAnchor.constraint(equalTo: self.infoView.bottomAnchor, constant: 20),
            repeatButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.07),
            repeatButton.trailingAnchor.constraint(equalTo: self.infoView.trailingAnchor),
            repeatButton.leadingAnchor.constraint(equalTo: self.infoView.leadingAnchor)
        ])

        self.addSubview(exitButton)
        NSLayoutConstraint.activate([
            exitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            exitButton.topAnchor.constraint(equalTo: self.repeatButton.bottomAnchor, constant: 8),
            exitButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.07),
            exitButton.trailingAnchor.constraint(equalTo: self.infoView.trailingAnchor),
            exitButton.leadingAnchor.constraint(equalTo: self.infoView.leadingAnchor)
        ])
    }
}
