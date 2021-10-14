//
//  ExercisesViewController.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 07/10/21.
//

import Foundation
import UIKit

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
    }

    override func loadView() {
        view = contentView
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
       print("User tapped on item \(indexPath.row)")
    }
}
