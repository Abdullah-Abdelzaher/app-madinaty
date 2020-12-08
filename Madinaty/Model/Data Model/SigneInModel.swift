//
//  SigneInModel.swift
//  Madinaty
//
//  Created by Abdullah on 12/6/20.
//

import Foundation

struct SigneInModel: Codable{
    var error: Int?
    var message: String?
    var data: SigneInDataModel?
    
}

struct SigneInDataModel: Codable{
    var id: Int?
    var username: String?
    var phone: String?
    var cityid: Int?
    var cityname: String?
    var areaid: Int?
    var areaname: String?
    var token: String?
    
    enum CodingKeys: String, CodingKey{
        case id, username, phone, token
        case cityid = "city_id"
        case cityname = "city_name"
        case areaid = "area_id"
        case areaname = "area_name"
        
    }
    
}
