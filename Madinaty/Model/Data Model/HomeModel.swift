//
//  HomeModel.swift
//  Madinaty
//
//  Created by Abdullah on 12/4/20.
//

import Foundation

struct HomeModel: Codable {
    var error: Int?
    var data: HomeDataModel?
    var message: String?
}

struct HomeDataModel: Codable{
    var Slider: [HomeDataFields]?
    var allCategories: [HomeDataFields]?
    var popularSections: [HomeDataFields]?
    var subcategory: [HomeDataFields]?
    
    enum CodingKeys: String, CodingKey{
        case Slider, subcategory
        case allCategories = "all_category"
        case popularSections = "popular_section"
    }
}

struct HomeDataFields: Codable {
    var id: Int?
    var image: String?
    var nameEn: String?
    var nameAr: String?
    
    enum CodingKeys: String, CodingKey{
        case id, image
        case nameEn = "name_en"
        case nameAr = "name_ar"
    }
}
