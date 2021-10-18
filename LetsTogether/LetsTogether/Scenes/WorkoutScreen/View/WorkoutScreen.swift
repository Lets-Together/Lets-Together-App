//
//  WorkoutScreen.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 13/09/21.
//

import Foundation
import UIKit
import Vision

class WorkoutScreen: UIView {

    var videoViewController: WorkoutVideoViewController?
    var handleSample: ((CMSampleBuffer) -> Void)?
    let cameraPreview = WorkoutVideoViewController()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }

    func configure(handleSample: @escaping ((CMSampleBuffer) -> Void)) {
        self.handleSample = handleSample
        backgroundColor = .white
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var scoresImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "crown.fill")
        imageView.tintColor = UIColor.init(displayP3Red: 242/255, green: 97/255, blue: 1/255, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()

    lazy var timeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "clock.fill")
        imageView.tintColor = UIColor.init(displayP3Red: 242/255, green: 97/255, blue: 1/255, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()

    lazy var currentScores: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 44)

        return label
    }()

    lazy var currentTime: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 44)

        return label
    }()

    lazy var quitButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor.init(displayP3Red: 242/255, green: 97/255, blue: 1/255, alpha: 1)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()

    lazy var statusView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 18
        view.backgroundColor = UIColor.init(displayP3Red: 255/255, green: 189/255, blue: 0/255, alpha: 1)
        view.alpha = 0.77

        return view
    }()
    
    public func updateTimerLabel(strTime: String) {
        currentTime.text = strTime
    }
    
    public func updateScoreLabel(strScore: String) {
        currentScores.text = strScore
    }
    
    private func addCameraPreview(preview: WorkoutVideoViewController) {
        self.addSubview(preview.view)
        preview.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            preview.view.leftAnchor.constraint(equalTo: self.leftAnchor),
            preview.view.rightAnchor.constraint(equalTo: self.rightAnchor),
            preview.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            preview.view.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }

    private func setConstraints() {
        cameraPreview.handleSample = self.handleSample
        addCameraPreview(preview: cameraPreview)

        self.addSubview(quitButton)
        NSLayoutConstraint.activate([
            quitButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            quitButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 19),
            quitButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            quitButton.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1)
        ])

        self.addSubview(statusView)
        NSLayoutConstraint.activate([
            statusView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            statusView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            statusView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            statusView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15)
        ])

        self.statusView.addSubview(scoresImage)
        NSLayoutConstraint.activate([
            scoresImage.leftAnchor.constraint(equalTo: self.statusView.leftAnchor, constant: 21),
            scoresImage.topAnchor.constraint(equalTo: self.statusView.topAnchor, constant: 11),
            scoresImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            scoresImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1)
        ])

        self.statusView.addSubview(timeImage)
        NSLayoutConstraint.activate([
            timeImage.leftAnchor.constraint(equalTo: self.statusView.leftAnchor, constant: 21),
            timeImage.topAnchor.constraint(equalTo: self.scoresImage.bottomAnchor, constant: 10),
            timeImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1),
            timeImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1)
        ])

        self.statusView.addSubview(currentScores)
        NSLayoutConstraint.activate([
            currentScores.leftAnchor.constraint(equalTo: self.scoresImage.rightAnchor, constant: 3),
            currentScores.centerYAnchor.constraint(equalTo: self.scoresImage.centerYAnchor)
        ])

        self.statusView.addSubview(currentTime)
        NSLayoutConstraint.activate([
            currentTime.leftAnchor.constraint(equalTo: self.timeImage.rightAnchor, constant: 3),
            currentTime.centerYAnchor.constraint(equalTo: self.timeImage.centerYAnchor)
        ])
    }
}
