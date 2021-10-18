//
//  InformationScreenViewController.swift
//  LetsTogether
//
//  Created by Gilberto Magno on 9/22/21.
//

import Foundation
import UIKit
import AVFoundation

class InformationScreenViewController: UIViewController {

    lazy var contentView: InformationScreenView = {
            let view = InformationScreenView()
            return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge()
        setupUI()
        contentView.scrollView.delegate = self

        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        frame.origin.x = contentView.scrollView.frame.width * CGFloat(0)
        frame.size = CGSize(width: contentView.scrollView.frame.width, height: contentView.scrollView.frame.height)
        let view = UIView(frame: frame)
        view.backgroundColor = .white
        view.tintColor = .blue
        let label = UILabel()
        label.text = "sdfsdfdsf"
        view.addSubview(label)
        contentView.scrollView.addSubview(view)

        frame.origin.x = contentView.scrollView.frame.width * CGFloat(1)
        frame.size = CGSize(width: contentView.scrollView.frame.width, height: contentView.scrollView.frame.height)
        let view1 = UIView(frame: frame)
        view1.backgroundColor = .white
        contentView.scrollView.addSubview(view1)

//        scroll.contentSize = CGSize(width: scroll.frame.width * CGFloat(2), height: scroll.frame.height)
        contentView.scrollView.contentSize = CGSize(width: 375, height: 800)
    }

    override func loadView() {
        view = contentView
    }

    func setupUI() {
        contentView.startButton.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped(_ : UIButton) {
        let bodyPontuatiion = BodyPontuationHelper(movementName: "jumping-jack", percetage: 0.8)
        let wksViewModel = WorkoutScreenViewModel(bodyPose: BodyPoseHelper(), bodyPontuation: bodyPontuatiion, timer: TimeHelper())
        let controller = WorkoutScreenViewController(workoutViewModel: wksViewModel)
        controller.modalPresentationStyle = .fullScreen
        self.show(controller, sender: self)
    }
}

extension InformationScreenViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("dscdscsd")
    }
}
