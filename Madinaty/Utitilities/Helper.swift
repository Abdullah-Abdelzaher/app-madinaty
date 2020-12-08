//
//  Healper.swift
//  Madinaty
//
//  Created by Abdullah on 12/4/20.
//

import UIKit
import Kingfisher

class Helper: NSObject {
    
    class func loadImage(url: String, image: UIImageView){
        let urlWithoutEncoding = (url)
        let encodedLink = urlWithoutEncoding.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            image.kf.setImage(with: url, placeholder: UIImage(named: "9"))
        }else{
            image.image = #imageLiteral(resourceName: "9")
        }
    }
    
    class func restartApp(){
        
    }
}
