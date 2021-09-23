//
//  InformationScreenView.swift
//  LetsTogether
//
//  Created by Gilberto Magno on 9/22/21.
//

import Foundation
import UIKit
import CoreMedia

class InformationScreenView: UIView {
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

    lazy var leftImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "SolidDownStickerStarJump")
        return view
    }()

    lazy var rightImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "SolidUpStickerStarJump")
        return view
    }()

    lazy var dataView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 41
        view.backgroundColor = .white
        view.alpha = 0.7
        view.isOpaque = false

        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Maximum Star Jump"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()

    lazy var attemptsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "⏰: No Time"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        return label
    }()

    lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle("Start Activity", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 255/255, green: 107/255, blue: 106/255, alpha: 1)

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

        self.addSubview(dataView)
        NSLayoutConstraint.activate([
            dataView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dataView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            dataView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            dataView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            dataView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60)
        ])

        self.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: self.dataView.bottomAnchor, constant: 24),
            startButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.07),
            startButton.leftAnchor.constraint(equalTo: dataView.leftAnchor),
            startButton.rightAnchor.constraint(equalTo: dataView.rightAnchor)
        ])

        self.dataView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.dataView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.dataView.topAnchor, constant: 30)
        ])

        self.dataView.addSubview(leftImage)
        NSLayoutConstraint.activate([
            leftImage.leftAnchor.constraint(equalTo: self.dataView.leftAnchor,constant: 24),
            leftImage.topAnchor.constraint(equalTo: self.dataView.topAnchor, constant: 84),
            leftImage.bottomAnchor.constraint(equalTo: dataView.bottomAnchor, constant: -120),
            leftImage.rightAnchor.constraint(equalTo: self.dataView.rightAnchor,constant: -201 )
        ])

        self.dataView.addSubview(attemptsLabel)
        NSLayoutConstraint.activate([
            attemptsLabel.leadingAnchor.constraint(equalTo: self.leftImage.leadingAnchor),
            attemptsLabel.bottomAnchor.constraint(equalTo: self.dataView.bottomAnchor, constant: -40)
        ])

        self.dataView.addSubview(rightImage)
        NSLayoutConstraint.activate([
            rightImage.rightAnchor.constraint(equalTo: self.dataView.rightAnchor, constant: -24),
            rightImage.topAnchor.constraint(equalTo: self.dataView.topAnchor, constant: 84),
            rightImage.bottomAnchor.constraint(equalTo: dataView.bottomAnchor, constant: -120),
            rightImage.leftAnchor.constraint(equalTo: self.dataView.leftAnchor,constant: 201)
        ])
    }
}
