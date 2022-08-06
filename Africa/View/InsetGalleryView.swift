//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Zardasht on 7/31/22.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK: Properety
    let animal: Animal
    
    
    //MARK: Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                
                ForEach(animal.gallery,id:\.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                    
                    }//loop
            }//HStack
        }//scroll
     }//body
}


//MARK: Preview
struct InsetGalleryView_Previews: PreviewProvider {
    
    static var previews: some View {
        let animal: [Animal] = Bundle.main.decode("animals.json")
        InsetGalleryView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
