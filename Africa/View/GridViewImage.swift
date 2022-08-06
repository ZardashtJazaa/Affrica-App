//
//  GridViewImage.swift
//  Africa
//
//  Created by Zardasht on 8/4/22.
//

import SwiftUI

struct GridViewImage: View {
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct GridViewImage_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        GridViewImage(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
