//
//  InsetFactView.swift
//  Africa
//
//  Created by Zardasht on 7/31/22.
//

import SwiftUI


struct InsetFactView: View {

    //MARK: Properety
    var animal: Animal
    //MARK: Body
    var body: some View {
        
        GroupBox {
            TabView {
                ForEach(animal.fact,id: \.self) { item in
                    Text(item)
                }//Loop
            }//:TabView
            .frame(minHeight: 148,idealHeight: 168, maxHeight:180)
            .tabViewStyle(PageTabViewStyle())
           
        }//:Box
     }
}
//MARK: Preview
struct InsetFactView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
