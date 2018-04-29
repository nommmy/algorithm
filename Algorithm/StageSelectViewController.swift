//
//  StageSelectViewController.swift
//  Algorithm
//
//  Created by 野見山陸 on 2018/04/29.
//  Copyright © 2018年 野見山陸. All rights reserved.
//

import UIKit

class StageSelectViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var stages = StageEasy.stages
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let currentCell = sender as? StageCell,
            let vc = segue.destination as? MapCreate,
            let currentCellIndex = collectionView.indexPath(for: currentCell) {
            vc.selectedIndex = currentCellIndex
        }
    }
    }


extension StageSelectViewController:UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? StageCell)!
        cell.stage = stages[indexPath.item]
        return cell
    }
}
