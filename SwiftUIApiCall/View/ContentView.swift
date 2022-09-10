//
//  ContentView.swift
//  SwiftUIApiCall
//
//  Created by Md Maruf Prodhan on 9/9/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.courses, id: \.self) { course in
                    CourseCard(image:course.image , name: course.name)
                }
                
            }
            .navigationTitle("Courses")
            .onAppear{
               // viewModel.fetch()
                viewModel.fetchGeneric()
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
