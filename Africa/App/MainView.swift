//
//  MainView.swift
//  Africa
//
//  Created by Zardasht on 7/30/22.
//

import SwiftUI

struct MainView: View {
    //MARK: Properety
    
    //MARK: Body
    var body: some View {
        
        TabView {
            
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }//tabItem
            
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }//tabItem
            
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
            
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }
            
        }//:TabView
        
        
    }
}


//MARK: Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
