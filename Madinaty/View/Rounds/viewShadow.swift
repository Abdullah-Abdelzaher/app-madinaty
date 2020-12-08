//
//  viewRound.swift
//  Mona
//
//  Created by Tariq on 8/26/19.
//  Copyright © 2019 Tariq. All rights reserved.
//

import UIKit

class viewShadow: UIView {

    var width: CGFloat = 0
    var height: CGFloat = 0
    
    @IBInspectable var offsetWidth: CGFloat = 0{
        didSet{
            self.width = offsetWidth
            self.setShadowOffset(self.width, self.height)
            self.layer.masksToBounds = false
        }
    }
    
    
    @IBInspectable var offsetHeight: CGFloat = 0{
        didSet{
            self.height = offsetHeight
            self.setShadowOffset(self.width, self.height)
            self.layer.masksToBounds = false
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0{
        didSet{
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0{
        didSet{
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear{
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowCornerRadius: CGFloat = 0{
        didSet{
            self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: shadowCornerRadius).cgPath
            self.layer.shouldRasterize = true
            self.layer.rasterizationScale = true ? UIScreen.main.scale : 1
        }
    }

    func setShadowOffset(_ offsetWidth: CGFloat , _ offsetHeight: CGFloat){
        self.layer.shadowOffset = CGSize(width: offsetWidth, height: offsetWidth)
    }
}
