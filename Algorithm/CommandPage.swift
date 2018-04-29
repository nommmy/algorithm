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
    @IBOutlet weak var command_image: UIImageView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let dragInteraction = UIDragInteraction(delegate: self)
        dragInteraction.isEnabled = true
        command_image.addInteraction(dragInteraction)
        command_table.addInteraction(UIDropInteraction(delegate: self))
        execution_table.addInteraction(UIDropInteraction(delegate: self))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    func dragInteraction(
        _ interaction: UIDragInteraction,
        itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        
        guard let image = command_image.image else { return [] }
        
        let provider = NSItemProvider(object: image)
        let item = UIDragItem(itemProvider: provider)
        item.localObject = image
        return [item]
    }
    
    func dropInteraction(
        _ interaction: UIDropInteraction,
        sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        
        let dropLocation = session.location(in: view)
        let operation: UIDropOperation
        
        if command_image.frame.contains(dropLocation) {
            operation = session.localDragSession == nil ? .copy : .move
        } else {
            operation = .cancel
        }
        
        return UIDropProposal(operation: operation)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        
        session.loadObjects(ofClass: UIImage.self) { imageItems in
            guard let images = imageItems as? [UIImage] else { return }
            
            self.command_image.image = images.first
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
