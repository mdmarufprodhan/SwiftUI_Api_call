//
//  CourseCard.swift
//  SwiftUIApiCall
//
//  Created by Md Maruf Prodhan on 9/9/22.
//

import SwiftUI

struct CourseCard: View {
    var image : String
    var name : String
    
    var body: some View {
        HStack {
        //    URLImage(urlString: course.image)
            
            AsyncImage(
                url:URL(string: image),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 130, maxHeight: 100)
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            Text(name)
                .bold()
            
        }
        .padding(3)
        
    
}
}

struct CourseCard_Previews: PreviewProvider {
    static var previews: some View {
        CourseCard(image: "", name: "")
    }
}
