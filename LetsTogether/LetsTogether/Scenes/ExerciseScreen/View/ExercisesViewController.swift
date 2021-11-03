//
//  ExercisesViewController.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 07/10/21.
//

import Foundation
import UIKit
import GameKit

class ExercisesViewController: UIViewController {

    let viewModel = ExerciseScreenViewModel()

    lazy var contentView: ExercisesView = {
        let view = ExercisesView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge()
        contentView.colletionView.dataSource = self
        contentView.colletionView.delegate = self
        contentView.gameCenterButton.addTarget(self, action: #selector(self.showLeaderboard), for: .touchUpInside)
    }

    override func loadView() {
        self.view = self.contentView
    }

    @objc func showLeaderboard(_ : UIButton) {
        let vc = GKGameCenterViewController(state: GKGameCenterViewControllerState.leaderboards)
        vc.gameCenterDelegate = self
        present(vc, animated: true, completion: nil)
    }
}

extension ExercisesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? ExerciseCell else {
            fatalError("DequeueReusableCell failed while casting")
        }

        myCell.exerciseNameLabel.text = viewModel.exerciseCards[indexPath.row].name
        myCell.exerciseImageView.image = UIImage(named: viewModel.exerciseCards[indexPath.row].image!)
        return myCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = InformationScreenViewController(exercise: viewModel.exerciseCards[indexPath.row])
        controller.modalPresentationStyle = .fullScreen
        self.show(controller, sender: self)
    }
}

extension ExercisesViewController: GKGameCenterControllerDelegate {
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        self.dismiss(animated: true, completion: nil)
    }
}
