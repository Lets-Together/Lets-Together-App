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
        label.text = "Lets Together"
        label.font = UIFont.boldSystemFont(ofSize: 32)

        return label
    }()

    lazy var infoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.backgroundColor = .systemGray
        view.alpha = 0.7

        return view
    }()

    lazy var titleScoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total Scores:"
        label.font = UIFont.boldSystemFont(ofSize: 24)

        return label
    }()

    lazy var scoresObtained: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1340"
        label.font = UIFont.boldSystemFont(ofSize: 32)

        return label
    }()

    lazy var repeatButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Repeat", for: .normal)
        button.layer.cornerRadius = 15

        return button
    }()

    lazy var exitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Exit", for: .normal)
        button.layer.cornerRadius = 15

        return button
    }()

    func setConstraints() {

        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 80)
        ])

        self.addSubview(infoView)
        NSLayoutConstraint.activate([
            infoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infoView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2),
            infoView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            infoView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -40),
            infoView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 80)
        ])

        self.infoView.addSubview(titleScoreLabel)
        NSLayoutConstraint.activate([
            titleScoreLabel.centerXAnchor.constraint(equalTo: self.infoView.centerXAnchor),
            titleScoreLabel.topAnchor.constraint(equalTo: self.infoView.topAnchor, constant: 5)
        ])

        self.infoView.addSubview(scoresObtained)
        NSLayoutConstraint.activate([
            scoresObtained.centerXAnchor.constraint(equalTo: self.infoView.centerXAnchor),
            scoresObtained.topAnchor.constraint(equalTo: self.titleScoreLabel.bottomAnchor, constant: 15)
        ])

        self.addSubview(repeatButton)
        NSLayoutConstraint.activate([
            repeatButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            repeatButton.topAnchor.constraint(equalTo: self.infoView.bottomAnchor, constant: 20),
            repeatButton.heightAnchor.constraint(equalToConstant: 40),
            repeatButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)
        ])

        self.addSubview(exitButton)
        NSLayoutConstraint.activate([
            exitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            exitButton.topAnchor.constraint(equalTo: self.repeatButton.bottomAnchor, constant: 6),
            exitButton.heightAnchor.constraint(equalToConstant: 40),
            exitButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)
        ])
    }
}
