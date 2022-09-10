//
//  viewModel.swift
//  SwiftUIApiCall
//
//  Created by Md Maruf Prodhan on 9/9/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var courses : [Course] = []
    func fetch(){
        APIService.getRequest(url:"https://iosacademy.io/api/v1/courses/index.php") {[weak self] courses in
            self?.courses = courses
        }
        
    }
    
    func fetchGeneric(){
        APIServiceGeneric.getRequest(url: "https://iosacademy.io/api/v1/courses/index.php") {[weak self] courses in
            self?.courses = courses
        }
    }
}
