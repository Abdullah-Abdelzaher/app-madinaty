//
//  HomeCategoryCell.swift
//  Madinaty
//
//  Created by Abdullah on 12/4/20.
//

import UIKit

class HomeCategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryNameLb: UILabel!
    
    func configure(category: HomeDataFields){
        Helper.loadImage(url: category.image ?? "", image: categoryImage)
        categoryNameLb.text = category.nameEn
    }
}
