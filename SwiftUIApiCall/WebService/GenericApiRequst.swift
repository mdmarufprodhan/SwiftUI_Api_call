//
//  ApiRequest.swift
//  SwiftUIApiCall
//
//  Created by Md Maruf Prodhan on 9/9/22.
//

import Foundation
//

class APIServiceGeneric {
    static func getRequest <T:Codable>(url:String ,completion: @escaping(T)->Void ){
        
        guard let url  = URL(string: url) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let webresponse = try JSONDecoder().decode(T.self , from: data)
                DispatchQueue.main.async {
                    completion(webresponse)
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
