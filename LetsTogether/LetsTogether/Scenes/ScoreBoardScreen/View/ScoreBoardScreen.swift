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

    lazy var navigationBar: UINavigationBar = {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 400))
        navBar.translatesAutoresizingMaskIntoConstraints = false
        let navItem = UINavigationItem()
        navBar.setItems([navItem], animated: false)
        return navBar
    }()

    lazy var titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        view.backgroundColor = UIColor.init(displayP3Red: 255/255, green: 189/255, blue: 0/255, alpha: 1)
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jumping Jack"
        label.font = UIFont.init(name: "Comfortaa-Bold", size: 28)
        label.textColor = UIColor.init(displayP3Red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        label.textAlignment = .center
        return label
    }()

    lazy var gameCenterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.init(displayP3Red: 255/255, green: 189/255, blue: 0/255, alpha: 1)
        button.setImage(UIImage(systemName: "globe"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = UIColor.init(displayP3Red: 242/255, green: 97/255, blue: 1/255, alpha: 1)
        return button
    }()

    lazy var infoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.backgroundColor = .white

        return view
    }()

    lazy var titleScoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Score"
        label.font = UIFont.init(name: "Lato-Bold", size: 32)
        label.textColor = UIColor(displayP3Red: 255/255, green: 189/255, blue: 0/255, alpha: 1)

        return label
    }()

    lazy var scoresImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "crown.fill")
        imageView.tintColor = UIColor.init(displayP3Red: 242/255, green: 97/255, blue: 1/255, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()

    lazy var scoresObtained: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1340"
        label.font = UIFont.init(name: "Lato-Bold", size: 36)
        label.textColor = UIColor(red: 0.23, green: 0.05, blue: 0.05, alpha: 1.0)

        return label
    }()

    lazy var infoTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Yeah, it's your new record!\nCongratilations!"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.init(name: "Lato-BoldItalic", size: 16)
        label.textColor = UIColor(displayP3Red: 255/255, green: 189/255, blue: 0/255, alpha: 1)

        return label
    }()

    lazy var restartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.init(name: "Comfortaa-Bold", size: 24)
        button.setTitle("Restart", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(displayP3Red: 242/255, green: 97/255, blue: 1/255, alpha: 1)
        return button
    }()

    lazy var exitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.init(name: "Comfortaa-Bold", size: 24)
        button.backgroundColor = UIColor(displayP3Red: 255/255, green: 228/255, blue: 209/255, alpha: 1)
        button.setTitle("Exit", for: .normal)
        button.setTitleColor(UIColor(displayP3Red: 242/255, green: 97/255, blue: 1/255, alpha: 1), for: .normal)
        button.layer.cornerRadius = 10

        return button
    }()

    func setConstraints() {

        self.addSubview(navigationBar)
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: self.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

        self.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: self.navigationBar.bottomAnchor),
            titleView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleView.heightAnchor.constraint(equalToConstant: 63)
        ])

        self.titleView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.titleView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.titleView.topAnchor, constant: 5)
        ])

        self.titleView.addSubview(gameCenterButton)
        NSLayoutConstraint.activate([
            gameCenterButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            gameCenterButton.trailingAnchor.constraint(equalTo: self.titleView.trailingAnchor, constant: -25),
            gameCenterButton.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.09),
            gameCenterButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.09)
        ])

        self.addSubview(infoView)
        NSLayoutConstraint.activate([
            infoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infoView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            infoView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            infoView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            infoView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 31)
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

        self.infoView.addSubview(scoresImage)
        NSLayoutConstraint.activate([
            scoresImage.rightAnchor.constraint(equalTo: self.scoresObtained.leftAnchor, constant: -10),
            scoresImage.centerYAnchor.constraint(equalTo: self.infoView.centerYAnchor),
            scoresImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            scoresImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1)
        ])

        self.infoView.addSubview(infoTextLabel)
        NSLayoutConstraint.activate([
            infoTextLabel.topAnchor.constraint(equalTo: self.scoresObtained.bottomAnchor, constant: 51),
            infoTextLabel.centerXAnchor.constraint(equalTo: self.infoView.centerXAnchor)
        ])

        self.addSubview(exitButton)
        NSLayoutConstraint.activate([
            exitButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            exitButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -38),
            exitButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.07),
            exitButton.trailingAnchor.constraint(equalTo: self.infoView.trailingAnchor),
            exitButton.leadingAnchor.constraint(equalTo: self.infoView.leadingAnchor)
        ])

        self.addSubview(restartButton)
        NSLayoutConstraint.activate([
            restartButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            restartButton.bottomAnchor.constraint(equalTo: self.exitButton.topAnchor, constant: -16),
            restartButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.07),
            restartButton.trailingAnchor.constraint(equalTo: self.infoView.trailingAnchor),
            restartButton.leadingAnchor.constraint(equalTo: self.infoView.leadingAnchor)
        ])
    }
}
