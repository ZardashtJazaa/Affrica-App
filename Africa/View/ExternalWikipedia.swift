//
//  ExternalWikipedia.swift
//  Africa
//
//  Created by Zardasht on 7/31/22.
//

import SwiftUI

struct ExternalWikipedia: View {
    //MARK: Properety
    let animal: Animal
    //MARK: Body
    var body: some View {
        
        GroupBox {
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                Text("Wikipedia")
                
                Spacer()
                Group {
                    Link(animal.name, destination:URL(string: animal.link) ??  URL(string: "https://Wikipedia.org")!)
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)
            }//HStack
        }//Box
        
    }
}

//MARK: Preview
struct ExternalWikipedia_Previews: PreviewProvider {
    static let animal: [Animal]  = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWikipedia(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
