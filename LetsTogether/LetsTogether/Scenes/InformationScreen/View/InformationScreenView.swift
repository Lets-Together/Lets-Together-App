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
        label.text = "Exercise's Name"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = UIColor.init(displayP3Red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        label.textAlignment = .center
        return label
    }()

    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.init(displayP3Red: 255/255, green: 189/255, blue: 0/255, alpha: 1)
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
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
        let scroll = UIScrollView(frame: .zero)
        scroll.isPagingEnabled = true
        scroll.isScrollEnabled = true
        scroll.backgroundColor = .black
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsHorizontalScrollIndicator = true

//        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
//        frame.origin.x = scroll.frame.width * CGFloat(0)
//        frame.size = CGSize(width: scroll.frame.width, height: scroll.frame.height)
//        let view = UIView(frame: frame)
//        view.backgroundColor = .black
//        scroll.addSubview(view)
//
//        frame.origin.x = scroll.frame.width * CGFloat(1)
//        frame.size = CGSize(width: scroll.frame.width, height: scroll.frame.height)
//        let view1 = UIView(frame: frame)
//        view1.backgroundColor = .white
//        scroll.addSubview(view1)
//
////        scroll.contentSize = CGSize(width: scroll.frame.width * CGFloat(2), height: scroll.frame.height)
//        scroll.contentSize = CGSize(width: 375, height: 800)
//        
        return scroll
    }()

    lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
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
            backButton.leadingAnchor.constraint(equalTo: self.titleView.leadingAnchor, constant: 25)
        ])

        self.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 37),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            scrollView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4)
        ])

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
