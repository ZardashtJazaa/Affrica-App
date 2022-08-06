//
//  GalleryView.swift
//  Africa
//
//  Created by Zardasht on 7/30/22.
//

import SwiftUI

struct GalleryView: View {
    //MARK: Properety
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    let haptick = UIImpactFeedbackGenerator(style: .medium)
  
   
    //MARK: Functions
    func gridSwitch() {
        
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
        
    }
    
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State private var selctedAnimal: String = "lion"
    
    
    //MARK: Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
                
            VStack(alignment: .center, spacing: 30) {
                //Image
                Image(selctedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth: 8))
                
                //Slider
                Slider(value: $gridColumn, in: 2 ... 4 , step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { newValue in
                      
                        gridSwitch()
                        
                    }
                  
                //Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white,lineWidth:1))
                        .onTapGesture {
                            selctedAnimal = item.image
                            haptick.impactOccurred()
                        }
                    }//Loop
                }//Grid
                .animation(.easeIn)
             }//Vstack
            .padding(.horizontal,10)
            .padding(.vertical,50)
            .onAppear {
                
                gridSwitch()
            }
        }//Scrolll
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(MotionAnimationVIew())
    }
    
}
//MARK: Preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
