//
//  viewModel.swift
//  SwiftUIApiCall
//
//  Created by Md Maruf Prodhan on 9/9/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    let getUrl = "https://iosacademy.io/api/v1/courses/index.php"
    @Published var courses : [Course] = []
    func fetch(){
        APIService.getRequest(url:getUrl) {[weak self] courses in
            self?.courses = courses
        }
        
    }
    
    func fetchWithAlamofire(){
        APIService.getRequestWithAlamofire(url:getUrl) { [weak self]  courses in
            self?.courses = courses
        }
    }
    
    func fetchGeneric(){
        APIServiceGeneric.getRequest(url: "https://iosacademy.io/api/v1/courses/index.php") {[weak self] courses in
            self?.courses = courses
        }
    }
}
