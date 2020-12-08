//
//  SigneUpApi.swift
//  Madinaty
//
//  Created by Abdullah on 12/7/20.
//

import UIKit
import Alamofire
class SigneUpApi: NSObject {

    class func getSigneUpData (completion: @escaping(_ dataError: Bool, _ isSuccess: Bool, _ signeInData: SigneUpDataModel?)-> Void){
        
        let header = ["lang": "ar"]
        let url = URLs.signeUp
        
        
        Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            do {
                switch response.result {
                case .failure(let error):
                    print(error)
                    completion(false,false,nil)
                case .success(let value):
                    print(value)
                    let signeUpData = try JSONDecoder().decode(SigneUpModel.self, from: response.data!)
                    completion(false, true,signeUpData.data)

                }
                
            }catch{
                completion(true, false, nil)

                
            }
        }
    }
    
    
    
}
