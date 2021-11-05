//
//  SlideView.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 05/11/21.
//

import Foundation
import UIKit

class SlideView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addComponents()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "squats")
        imageView.tintColor = UIColor.init(displayP3Red: 242/255, green: 97/255, blue: 1/255, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true

        return imageView
    }()

    lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = ""
        textLabel.numberOfLines = 5
        textLabel.textAlignment = .center
        textLabel.font = UIFont.init(name: "Comfortaa-Bold", size: 16)
        textLabel.textColor = UIColor.init(displayP3Red: 242/255, green: 97/255, blue: 1/255, alpha: 1)
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        return textLabel
    }()

    func addComponents() {
        self.addSubview(imageView)
        self.addSubview(textLabel)
    }

    func setConstraints() {

        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -130)
        ])

        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
