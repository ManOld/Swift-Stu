//
//  CustomButton.swift
//  EnumView
//
//  Created by LH on 2021/7/6.
//  Copyright © 2021 LH. All rights reserved.
//

import UIKit
enum ButtonImagePosition : Int {
    case ButtonImagePositionTop = 0
    case ButtonImagePositionLeft = 1
    case ButtonImagePositionRight = 2
    case ButtonImagePositionBottom = 3
}
extension UIButton {
    /**
     imageName:图片名称
     title:button名称
     type:image位置
     space：图片文字间距
     */
    func setImageAndTitle(imageName:String, title:String, type:ButtonImagePosition, space:CGFloat) {
        self.setTitle(title, for: .normal)
        self.setImage(UIImage(named: imageName), for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        
        let imageWith   :CGFloat = (self.imageView?.frame.size.width)!
        let imageHeight :CGFloat = (self.imageView?.frame.size.height)!
        
        var labelWidth  :CGFloat = 0.0
        var labelHeight :CGFloat = 0.0
        
        labelWidth = CGFloat(self.titleLabel!.intrinsicContentSize.width)
        labelHeight = CGFloat(self.titleLabel!.intrinsicContentSize.height)
        
        var imageEdgeInsets :UIEdgeInsets = UIEdgeInsets()
        var labelEdgeInsets :UIEdgeInsets = UIEdgeInsets()
        
        switch type {
        case .ButtonImagePositionTop:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight - space/2.0, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith, bottom: -imageHeight - space/2, right: 0)
            
        case .ButtonImagePositionLeft:
            
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: -space/2.0)
            
        case .ButtonImagePositionBottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight - space/2.0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -labelHeight - space/2.0, left: -imageWith, bottom: 0, right: 0)
            
        case .ButtonImagePositionRight:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+space/2.0, bottom: 0, right: -labelWidth-space/2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith-space/2.0, bottom: 0, right: imageWith+space/2.0)
            
        }
        
        //赋值
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        
        
        
        
    }
}
