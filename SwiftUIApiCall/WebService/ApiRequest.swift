//
//  ApiRequest.swift
//  SwiftUIApiCall
//
//  Created by Md Maruf Prodhan on 9/9/22.
//

import Foundation
//

class APIService {
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
