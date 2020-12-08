//
//  SigneInApi.swift
//  Madinaty
//
//  Created by Abdullah on 12/6/20.
//

import UIKit
import Alamofire
class SigneInApi: NSObject {
    
    class func getSigneInData (completion: @escaping(_ dataError: Bool, _ isSuccess: Bool, _ signeInData: SigneInDataModel?)-> Void){
        
        let header = ["lang": "ar"]
        let url = URLs.signeIn
        
        
        Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            do {
                switch response.result {
                case .failure(let error):
                    print(error)
                    completion(false,false,nil)
                case .success(let value):
                    print(value)
                    let signeInData = try JSONDecoder().decode(SigneInModel.self, from: response.data!)
                    completion(false, true,signeInData.data)

                }
                
            }catch{
                completion(true, false, nil)

                
            }
        }
    }
    

}
