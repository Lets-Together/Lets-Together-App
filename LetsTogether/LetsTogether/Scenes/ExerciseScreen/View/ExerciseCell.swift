//
//  ExerciseCell.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 08/10/21.
//

import Foundation
import UIKit

class ExerciseCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let descriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(displayP3Red: 242/255, green: 97/255, blue: 1/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0.77
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()

    let exerciseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "cris")
        imageView.layer.cornerRadius = 16
        imageView.contentMode = UIView.ContentMode.scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        return imageView
    }()

    let exerciseNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.init(name: "Comfortaa-Regular", size: 24)
        label.text = "Exercise"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func addComponents() {
        self.addSubview(exerciseImageView)
        self.addSubview(descriptionView)
        self.addSubview(exerciseNameLabel)
    }

    func setConstraints() {
        
        NSLayoutConstraint.activate([
            exerciseImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            exerciseImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            exerciseImageView.topAnchor.constraint(equalTo: self.topAnchor),
            exerciseImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            descriptionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            descriptionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            descriptionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            descriptionView.heightAnchor.constraint(equalTo: self.exerciseImageView.heightAnchor, multiplier: 0.15)
        ])

        NSLayoutConstraint.activate([
            exerciseNameLabel.centerYAnchor.constraint(equalTo: self.descriptionView.centerYAnchor),
            exerciseNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
