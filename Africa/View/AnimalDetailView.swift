//
//  TestDetailView.swift
//  Africa
//
//  Created by Zardasht on 7/31/22.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal: Animal
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false) {
            //hereo
            VStack(alignment:.center , spacing: 20) {
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                //name
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical,8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height:6)
                            .offset(y:24)
                    )
                  
                //Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                //Gallery
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                //Fact
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
               //Description
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about  \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                
                //MAP
                Group {
                    HeadingView(headingImage: "map", headingText: "Locations")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                
                //LearnMore
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalWikipedia(animal: animal)
                }
                .padding(.horizontal)
            
                
                
            }//VStack
            .navigationBarTitle("Learn about \(animal.name)",displayMode: .inline)
        }//scrollview
        
        
        
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animal:[Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animal[0])
        }
        .previewDevice("iPhone 12 Pro")
        
    }
}
