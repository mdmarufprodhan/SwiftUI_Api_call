//
//  ApiRequest.swift
//  SwiftUIApiCall
//
//  Created by Md Maruf Prodhan on 9/9/22.
//

import Foundation
import Alamofire


class APIService {
    
    static func getRequestWithAlamofire(url:String ,completion: @escaping ([Course])->Void){
        let headers: HTTPHeaders = [
           // "Authorization": "Basic VXNlcm5hbWU6UGFzc3dvcmQ=",
            "Accept": "application/json"
        ]

        AF.request(url, headers: headers).responseDecodable(of:[Course].self) { response in
            debugPrint(response)
            switch response.result {
                
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    
    
    static func getRequest(url:String ,completion: @escaping([Course])->Void ){
        
        guard let url  = URL(string: url) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let courses = try JSONDecoder().decode([Course].self , from: data)
                DispatchQueue.main.async {
                    completion(courses)
                }
                
            }
            catch{
                print(error)
                
            }
            
        }
        //convert to json
        
        
        task.resume()
        
    }
}
