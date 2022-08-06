//
//  CoverImageView.swift
//  Africa
//
//  Created by Zardasht on 7/30/22.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: Properety
    let coverImage: [CoverImage] = Bundle.main.decode("covers.json")
    //MARK: Body
    var body: some View {
        
        TabView {
            
            ForEach(coverImage) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//LOOP
          }//:Tab
        .tabViewStyle(PageTabViewStyle())
        
        
    }
}

//MARK: Preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
