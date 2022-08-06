//
//  ContentView.swift
//  Africa
//
//  Created by Zardasht on 7/30/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: Property
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    @State private var  gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumns: Int = 1
    @State private var isGridActivate: Bool = false
    @State private var toolbarImage: String = "square.grid.2x2"
    
    //MARK: Functions
    func switchGrid() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumns = gridLayout.count
        
        switch gridColumns {
        case 1:
            toolbarImage = "square.grid.2x2"
        case 2:
            toolbarImage = "square.grid.3x2"
        case 3:
            toolbarImage = "rectangle.grid.1x2"
        default:
            toolbarImage = "square.grid.2x2"
        }
    }
    //MARK: Body
    var body: some View {
        
        NavigationView {
            Group {
                if !isGridActivate {
                    List {
                        CoverImageView()
                            .frame(height:300)
                        //.frame(width:400)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) {value in
                            NavigationLink(destination: AnimalDetailView(animal: value)) {
                                AnimalListView(animal: value)
                            }//Link
                        }//Loop
                        CreditsView()
                            .modifier(CenterModifier())
                    }//List
                    
                } else {
                    ScrollView(.vertical,showsIndicators: false) {
                        LazyVGrid(columns: gridLayout ,alignment: .center , spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    GridViewImage(animal: animal)
                                }//Link
                            }//Loop
                         }//grid
                        .padding(10)
                        .animation(.easeIn)
                    }//Scroll
                }//:List
            }//Group
            .listStyle(.plain)
            .navigationBarTitle("Africa",displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing:10) {
                        //List
                        Button(action:{
                            isGridActivate = false
                            haptic.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridActivate ? .primary : .accentColor)
                        }
                        
                        //Grid
                        Button(action: {
                            isGridActivate = true
                            haptic.impactOccurred()
                            switchGrid()
                        }) {
                            Image(systemName: toolbarImage)
                                .font(.title2)
                                .foregroundColor( isGridActivate ? .accentColor : .primary)
                        }
                     }//HStack
                }//toolbarItem
            }//Toolbar
        }//:Navigation
    }
}
//MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
