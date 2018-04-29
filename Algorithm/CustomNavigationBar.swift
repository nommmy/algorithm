//
//  CustomNavigationBar.swift
//  Algorithm
//
//  Created by 野見山陸 on 2018/04/21.
//  Copyright © 2018年 野見山陸. All rights reserved.
//

import UIKit

class CustomNavigationBar: UINavigationBar {

    //デフォルトよりどれだけ高くするか
    let addHeight:CGFloat = 28.0
    let myBoundSize: CGSize = UIScreen.main.bounds.size
    
    @IBOutlet weak var navBar: CustomNavigationBar!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        //渡されるsizeは widthは決まっているがheightは決まっていない
        //super.sizeThatFits(size)でheightが決まる
        var newSize = CGSize(width : myBoundSize.width, height:44)
        
        //ここ後々調整。今のままだと適用されてない
        //iphoneX用
        var topInset:CGFloat = 0
        if #available(iOS 11.0, *) {
            topInset = superview?.safeAreaInsets.top ?? 0
        }
        
        newSize.height += addHeight + topInset  //通常よりどれだけ大きくするか
        
        return newSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if #available(iOS 11.0, *) {
            for subview in self.subviews {
                let stringFromClass = NSStringFromClass(subview.classForCoder)
                if stringFromClass.contains("BarBackground") {
                    //ステータスバー分あげないと余白ができる。
                    let statusBarHeight = UIApplication.shared.statusBarFrame.height
                    var point = CGPoint(x:0,y:-statusBarHeight)
                    
                    //iPhoneXならステータスバー表示しない時に0.0になるので、確認しないといけない
                    if let top = superview?.safeAreaInsets.top,
                        top != 0 && statusBarHeight == 0{
                        point = CGPoint(x:0,y:-top)
                    }
                    //ここでバーの高さを調節 (sizeThatFitsを呼び出す)
                    subview.frame = CGRect(origin: point, size: sizeThatFits(self.bounds.size))
                }else if stringFromClass.contains("BarContentView") {
                    //ここでサブビューの位置を調整
                    subview.frame.origin.y = addHeight-10
                }
            }
        }
    }
    
    
  
}
