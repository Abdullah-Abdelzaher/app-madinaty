//
//  famousPlacesCell.swift
//  Madinaty
//
//  Created by Abdullah on 12/4/20.
//

import UIKit

class famousPlacesCell: UICollectionViewCell {
    
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeNameLb: UILabel!
    
    func configure(place: HomeDataFields){
        Helper.loadImage(url: place.image ?? "", image: placeImage)
        placeNameLb.text = place.nameEn
    }
}
