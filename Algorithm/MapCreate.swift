//
//  MapCreate.swift
//  Algorithm
//
//  Created by 野見山陸 on 2018/04/16.
//  Copyright © 2018年 野見山陸. All rights reserved.
//

import UIKit

class MapCreate: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate{
    
    public let mapData:[[Int]] = [[1,1,1,1,1,1,
                                   1,0,0,0,3,1,
                                   1,0,0,0,0,1,
                                   1,0,0,0,0,1,
                                   1,2,0,0,0,1,
                                   1,1,1,1,1,1] ,
                                  [1,1,1,1,1,1,
                                   1,1,0,3,1,1,
                                   1,1,0,0,1,1,
                                   1,1,0,0,1,1,
                                   1,1,2,0,1,1,
                                   1,1,1,1,1,1]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // ここでStoryBoard上で設定したIdentifierを使用する
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
//        if mapData[stageId][indexPath.item]==1{
//             cell.imgview.image = UIImage(named: "block1.jpg")
//        }else if mapData[stageId][indexPath.item]==2{
//             cell.imgview.image = UIImage(named: "ghost_back.jpg")
//        }else if mapData[stageId][indexPath.item]==3{
//            cell.imgview.image = UIImage(named: "flag.jpg")
//        }else{
//            cell.imgview.image = UIImage(named: "block2.jpg")
//        }
       
        // セルの中身の作成
        return cell
    }
    

    // セクションの数（今回は1つだけです）
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // 表示するセルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 36
    }
    
    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destinationViewController.
         Pass the selected object to the new view controller.
    }
    */

}
