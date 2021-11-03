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

    let viewModel = InformationScreenViewModel()

    lazy var contentView: InformationScreenView = {
        let view = InformationScreenView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge()
        setupUI()
        self.contentView.scrollView.delegate = self
    }

    override func loadView() {
        view = contentView
    }

    init(exercise: Exercise) {
        self.viewModel.exercise = exercise
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        contentView.startButton.addTarget(self, action: #selector(self.startButtonTapped), for: .touchUpInside)
        contentView.backButton.addTarget(self, action: #selector(self.backButtonTapped), for: .touchUpInside)
        contentView.titleLabel.text = viewModel.exercise?.name
        contentView.imageView.image = UIImage(named: viewModel.exercise.image!)
    }

    @objc func startButtonTapped(_ : UIButton) {
        let bodyPontuatiion = BodyPontuationHelper(movementName: "jumping-jack", percetage: 0.8)
        let wksViewModel = WorkoutScreenViewModel(bodyPose: BodyPoseHelper(), bodyPontuation: bodyPontuatiion, timer: TimeHelper(timeToFinish: self.viewModel.exercise.time), exercise: viewModel.exercise)
        let controller = WorkoutScreenViewController(workoutViewModel: wksViewModel)
        controller.modalPresentationStyle = .fullScreen
        self.show(controller, sender: self)
    }

    @objc func backButtonTapped(_ : UIButton) {
        let controller = ExercisesViewController()
        controller.modalPresentationStyle = .fullScreen
        self.show(controller, sender: self)
    }
}

extension InformationScreenViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/300)
        contentView.pageControl.currentPage = Int(pageIndex)
    }
}
