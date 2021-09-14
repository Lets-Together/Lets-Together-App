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
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false

        return mainView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lets Together"
        label.font = UIFont.boldSystemFont(ofSize: 32)

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

        self.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -80),
            startButton.heightAnchor.constraint(equalToConstant: 40),
            startButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)
        ])
    }
}
