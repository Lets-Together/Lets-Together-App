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
        label.text = "Exercise's Name"
        label.textColor = UIColor.init(displayP3Red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        label.textAlignment = .center

        return label
    }()

    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.init(displayP3Red: 255/255, green: 189/255, blue: 0/255, alpha: 1)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
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

    lazy var pageControl: UIPageControl = {
        let control = UIPageControl(frame: .zero)
        control.numberOfPages = 2
        control.currentPage = 0
        control.pageIndicatorTintColor = .lightGray
        control.currentPageIndicatorTintColor = .black
        control.translatesAutoresizingMaskIntoConstraints = false

        return control
    }()

    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: CGRect(x: 0, y: 300, width: 300, height: 400))
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.backgroundColor = .white
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.contentSize = CGSize(width: 600 , height: 350)
        scroll.layer.cornerRadius = 16

        return scroll
    }()

    lazy var slideOne: UIView = {
        var frame = CGRect(x: 0, y: 0, width: 300, height: 350)
        let slideOne = UIView(frame: frame)
        slideOne.backgroundColor = .white

        return slideOne
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "crown.fill")
        imageView.tintColor = UIColor.init(displayP3Red: 242/255, green: 97/255, blue: 1/255, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true

        return imageView
    }()

    lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Doing jumping jacks you: works the whole body, improves motor coordination, contributes to heart health and burns calories. So do jumping jacks with us!"
        textLabel.numberOfLines = 5
        textLabel.textAlignment = .left
        textLabel.textColor = .black
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        return textLabel
    }()

    lazy var slideTwo: UIView = {
        var frame = CGRect(x: 300, y: 0, width: 300, height: 350)
        let slideTwo = UIView(frame: frame)
        slideTwo.backgroundColor = .black

        return slideTwo
    }()

    lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.init(name: "Comfortaa-Bold", size: 24)
        button.backgroundColor = UIColor.init(displayP3Red: 242/255, green: 97/255, blue: 1/255, alpha: 1)
        button.setTitle("Start", for: .normal)
        button.layer.cornerRadius = 15

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

        self.titleView.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: self.titleView.leadingAnchor, constant: 25),
            backButton.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.07),
            backButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.05)
        ])

        self.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 37),
            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 350),
            scrollView.widthAnchor.constraint(equalToConstant: 300)
        ])

        self.scrollView.addSubview(slideOne)

        self.slideOne.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.slideOne.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.slideOne.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.slideOne.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.slideOne.bottomAnchor, constant: -130)
        ])

        self.slideOne.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: self.slideOne.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: self.slideOne.trailingAnchor),
            textLabel.bottomAnchor.constraint(equalTo: self.slideOne.bottomAnchor)
        ])

        self.scrollView.addSubview(slideTwo)

        self.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 4)
        ])

        self.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            startButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.07),
            startButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            startButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20)
        ])
    }
}
