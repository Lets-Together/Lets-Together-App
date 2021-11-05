//
//  ExercisesView.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 07/10/21.
//

import Foundation
import UIKit

class ExercisesView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        view.backgroundColor = UIColor.init(displayP3Red: 255/255, green: 189/255, blue: 0/255, alpha: 1)
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.isOpaque = false

        return view
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Comfortaa-Bold", size: 28)
        label.text = "Activities"
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

    lazy var navigationBar: UINavigationBar = {
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 400))
        navBar.translatesAutoresizingMaskIntoConstraints = false

        let navItem = UINavigationItem()
        navBar.setItems([navItem], animated: false)
        return navBar
    }()

    lazy var colletionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 331, height: 180)
        layout.scrollDirection = .vertical
        let myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCollectionView.register(ExerciseCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.backgroundColor = .white
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        myCollectionView.showsVerticalScrollIndicator = false

        return myCollectionView
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

        self.addSubview(colletionView)
        NSLayoutConstraint.activate([
            colletionView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 10),
            colletionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            colletionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            colletionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
