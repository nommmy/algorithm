//
//  CommandPage.swift
//  Algorithm
//
//  Created by 野見山陸 on 2018/04/22.
//  Copyright © 2018年 野見山陸. All rights reserved.
//

import UIKit

class CommandPage: UIViewController, UIDropInteractionDelegate,UIDragInteractionDelegate, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var command_table: UITableView!
    @IBOutlet weak var execution_table: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        command_table.addInteraction(UIDropInteraction(delegate: self))
        execution_table.addInteraction(UIDropInteraction(delegate: self))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dragInteraction(_ interaction: UIDragInteraction,
                         itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        let text = "うぇーいｗｗ" as NSString
        return [UIDragItem(itemProvider: NSItemProvider(object: text))]
    }
    
    func dropInteraction(_ interaction: UIDropInteraction,
                         sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        // ドロップできない場所では .forbidden を返します。
//        let point = session.location(in: execution_table)
//        guard forbiddenView != execution_table.hitTest(point, with: nil) else{
//            return UIDropProposal(operation: .forbidden)
//        }
        
        // ドラッグ中のアイテムが文字列を含んでいる場合はドロップできます。
        if session.canLoadObjects(ofClass: NSString.self) {
            return UIDropProposal(operation: .move)
        } else {
            return UIDropProposal(operation: .cancel)
        }
    }
    
    
    func dropInteraction(_ interaction: UIDropInteraction,
                         performDrop session: UIDropSession) {
        for item in session.items {
            // 文字列をロードできないアイテムはスキップします
            if item.itemProvider.canLoadObject(ofClass: NSString.self) {
                item.itemProvider.loadObject(ofClass: NSString.self) { (object, error) in
                    // アイテムのロードは非同期に行われます
                    // ロードが終わるとここにやってきます
                    if (object as? NSString) != nil {
                        // UIへの反映はメインスレッドで行います
                        DispatchQueue.main.async {
                           // self.infoLabel.text = String(format: "Dropped string - %@", string)
                        }
                    }
                }
            }
        }
    }
    
    
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = command_table.dequeueReusableCell(withIdentifier: "commandcell", for: indexPath)
        cell.addInteraction(UIDragInteraction(delegate: self))
        
        return cell
    }
    


}
