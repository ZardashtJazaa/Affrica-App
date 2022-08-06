//
//  MapAnnotationsView.swift
//  Africa
//
//  Created by Zardasht on 8/1/22.
//

import SwiftUI

struct MapAnnotationsView: View {
    //MARK: Properety
    let locations: NationalParkLocations
    @State private var Animating:Double = 0.0
    
     //MARK: Body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
                
            Circle()
                .stroke(Color.accentColor,lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(Animating))
            
                .opacity(1 - Animating)
            
            Image(locations.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }//:ZStack
        .onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                Animating = 1
            }
        }
    }//:Body
}

//MARK: Preview
struct MapAnnotationsView_Previews: PreviewProvider {
    
    static let locations: [NationalParkLocations] = Bundle.main.decode("locations.json")
    static var previews: some View {
        
        MapAnnotationsView(locations: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
