//
//  HomeApi.swift
//  Madinaty
//
//  Created by Abdullah on 12/4/20.
//

import UIKit
import Alamofire

class HomeApi: NSObject {

    class func getHomeData(areaId: Int, completion: @escaping(_ dataError: Bool, _ isSuccess: Bool, _ homeData: HomeDataModel?)-> Void){
        
        let header = ["lang": "ar"]
        let url = "\(URLs.homeData)?area_id=\(areaId)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            do{
                switch response.result{
                case .failure(let error):
                    print(error)
                    completion(false, false, nil)
                case .success(let value):
                    print(value)
                    let homeData = try JSONDecoder().decode(HomeModel.self, from: response.data!)
                    completion(false, true, homeData.data)
                }
            }catch{
                completion(true, false, nil)
            }
        }
    }
}
