//
//  ShowAreaByCityIdModel.swift
//  Madinaty
//
//  Created by Abdullah on 12/8/20.
//

import Foundation

struct ShowAreaByCityIdModel: Codable {
    var error: Int?
    var message: String?
    var data: ShowAreaByCityIdDataModel?

}

struct ShowAreaByCityIdDataModel: Codable {
    var id: Int?
    var nameEn: String?
    var nameAr: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nameEn = "name_en"
        case nameAr = "name_ar"
    }
    
}
