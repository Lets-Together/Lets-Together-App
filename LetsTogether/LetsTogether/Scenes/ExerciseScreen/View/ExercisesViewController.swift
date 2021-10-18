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
        view = contentView
        GKLocalPlayer.local.authenticateHandler = { viewController, error in
            if let viewController = viewController {
                self.present(viewController, animated: true, completion: nil)
                return
            }
            if error != nil {
                // Player could not be authenticated.
                // Disable Game Center in the game.
                return
            }

            // Player was successfully authenticated.
            // Check if there are any player restrictions before starting the game.

            if GKLocalPlayer.local.isUnderage {
                // Hide explicit game content.
            }

            if GKLocalPlayer.local.isMultiplayerGamingRestricted {
                // Disable multiplayer game features.
            }

            if GKLocalPlayer.local.isPersonalizedCommunicationRestricted {
                // Disable in game communication UI.
            }

            // Perform any other configurations as needed (for example, access point).
        }
    }

    @objc func showLeaderboard(_ : UIButton) {
            let vc = GKGameCenterViewController(leaderboardID: "leaderboard.highscore.year", playerScope: .global, timeScope: .allTime)
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
        return myCell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = InformationScreenViewController()
        controller.modalPresentationStyle = .fullScreen
        self.show(controller, sender: self)
    }
}

extension ExercisesViewController: GKGameCenterControllerDelegate {
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        self.dismiss(animated: true, completion: nil)
    }
}
