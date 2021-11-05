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

    var imageType: String = "jumping-jack"

    required init(imageType: String) {
        super.init(frame: .zero)
        self.imageType = imageType
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
        control.numberOfPages = 3
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
        scroll.contentSize = CGSize(width: 900 , height: 350)
        scroll.layer.cornerRadius = 16

        return scroll
    }()

    lazy var slideOne: SlideView = {
        slideOne = SlideView(frame:  CGRect(x: 0, y: 0, width: 300, height: 350))
        if imageType.elementsEqual("jumping-jack") {
            slideOne.imageView.image = UIImage(named: imageType + "1")
            slideOne.textLabel.text = "1. Bring your feet and arms to your body."
        } else {
            slideOne.textLabel.text = "1. Stand with feet parallel.\n\n2. Extend your arms."
        }

        return slideOne
    }()

    lazy var slideTwo: SlideView = {
        slideTwo = SlideView(frame:  CGRect(x: 300, y: 0, width: 300, height: 350))
        if imageType.elementsEqual("jumping-jack") {
            slideTwo.imageView.image = UIImage(named: imageType + "2")
            slideTwo.textLabel.text = "2. Jump by opening your legs and raising your arms, giving a slight bend in the knee."
        } else {
            slideTwo.textLabel.text = "3. Bend your knees without taking your feet off the floor.\n\n4. Move down until your hips are just below your knees."
        }

        return slideTwo
    }()

    lazy var slideThree: SlideView = {
        slideThree = SlideView(frame:  CGRect(x: 600, y: 0, width: 300, height: 350))
        if imageType.elementsEqual("jumping-jack") {
            slideThree.imageView.image = UIImage(named: imageType + "3")
            slideThree.textLabel.text = "3. Return to start position."
        } else {
            slideThree.textLabel.text = "5. Return to your home position.\n\n6. Keep your eyes straight ahead."
        }

        return slideThree
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
        self.scrollView.addSubview(slideTwo)
        self.scrollView.addSubview(slideThree)

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
