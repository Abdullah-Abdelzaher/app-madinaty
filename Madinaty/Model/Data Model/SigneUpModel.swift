//
//  SigneUpModel.swift
//  Madinaty
//
//  Created by Abdullah on 12/7/20.
//

import Foundation

struct SigneUpModel: Codable {
    var error: Int?
    var data: SigneUpDataModel?
    var message: String?
}

struct SigneUpDataModel: Codable {
    
    var id: Int?
    var username: String?
    var phone: String?
    var cityId: Int?
    var cityName: String?
    var areaId: Int?
    var areaName: String?
    var token: String?
    
    enum CodingKeys: String, CodingKey{
        case id, username, phone, token
        case cityId = "city_id"
        case cityName = "city_name"
        case areaId = "area_id"
        case areaName = "area_name"
        
    }
}
