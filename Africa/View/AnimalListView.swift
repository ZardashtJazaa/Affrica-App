//
//  AnimalListView.swift
//  Africa
//
//  Created by Zardasht on 7/30/22.
//

import SwiftUI

struct AnimalListView: View {
    //MARK: Properety
    let animal: Animal
    //MARK: Body
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
                
            VStack(alignment:.leading ,spacing:8) {
                Text(animal.name)
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .fontWeight(.heavy)
                Text(animal.headline)
                    .font(.footnote)
                    .lineLimit(2)
                    .padding(.trailing,8)
                    .multilineTextAlignment(.leading)
                    
            }//VStack
        }//HStack
        
    }
}

//MARK: Preview
struct AnimalListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        AnimalListView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
