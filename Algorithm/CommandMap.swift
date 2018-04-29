//
//  CommandMap.swift
//  Algorithm
//
//  Created by 野見山陸 on 2018/04/29.
//  Copyright © 2018年 野見山陸. All rights reserved.
//

import UIKit

class CommandMap: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
      closeButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
    }
    
    @IBAction func closeAction(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
