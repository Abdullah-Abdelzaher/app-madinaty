//
//  subcategoriesCell.swift
//  Madinaty
//
//  Created by Abdullah on 12/4/20.
//

import UIKit

class subcategoriesCell: UICollectionViewCell {
    
    @IBOutlet weak var subcategoryImage: UIImageView!
    @IBOutlet weak var subcategoryNameLb: UILabel!
    
    func configure(subCategory: HomeDataFields){
        Helper.loadImage(url: subCategory.image ?? "", image: subcategoryImage)
        subcategoryNameLb.text = subCategory.nameEn
    }
    
}
