//
//  OnBoardingView.swift
//  LetsTogether
//
//  Created by Gilberto Magno on 11/5/21.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class OnBoardingView: UIView {
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

    lazy var titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        view.backgroundColor = UIColor.init(displayP3Red: 255/255, green: 189/255, blue: 0/255, alpha: 1)
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.isOpaque = false

        return view
    }()

    lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrowshape.turn.up.forward.fill"), for: .normal)
        button.tintColor = UIColor.init(displayP3Red: 242/255, green: 97/255, blue: 1/255, alpha: 1)
        button.layer.cornerRadius = 15

        return button
    }()

    lazy var repeatButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.counterclockwise"), for: .normal)
        button.tintColor = UIColor.init(displayP3Red: 242/255, green: 97/255, blue: 1/255, alpha: 1)
        return button
    }()

    func fadeButton() {}

    
    func setConstraints() {
        self.addSubview(videoView)
               NSLayoutConstraint.activate([
                   videoView.leftAnchor.constraint(equalTo: self.leftAnchor),
                   videoView.rightAnchor.constraint(equalTo: self.rightAnchor),
                   videoView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                   videoView.topAnchor.constraint(equalTo: self.topAnchor)
               ])
        self.addSubview(startButton)
                NSLayoutConstraint.activate([
                    startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: 130),
                    startButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
                    startButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15),
                    startButton.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15)

                ])

        self.addSubview(repeatButton)
                NSLayoutConstraint.activate([
                    repeatButton.centerXAnchor.constraint(equalTo: self.centerXAnchor,constant: -130),
                    repeatButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
                    repeatButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15),

                ])

    }
}

