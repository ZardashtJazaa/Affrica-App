//
//  MapView.swift
//  Africa
//
//  Created by Zardasht on 7/30/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: Properety
    @State private var region: MKCoordinateRegion =  {
        var mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel  = MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
        return mapRegion
     }()
    
    let locations: [NationalParkLocations] = Bundle.main.decode("locations.json")
    
    //MARK: Body
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // (A) old Style (static type)
            //MapPin(coordinate: item.thumbLocations , tint: .accentColor)
            
            // (B) newStyle (static type)
            //MapMarker(coordinate: item.thumbLocations, tint: .accentColor)
        
            // (C) Annotation (Could be interactive)
            MapAnnotation(coordinate: item.thumbLocations) {
                MapAnnotationsView(locations: item)
                    
            }
        }//map
        .overlay(
            HStack {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//HStack
                    Divider()
                    
                    HStack {
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//HStack
                    
                }//VStack
            }//HStack
                .padding(.vertical,12)
                .padding(.horizontal,16)
                .background(
                    Color.black
                        .cornerRadius(9)
                        .opacity(0.6)
                )
                .padding()
                
            ,alignment: .top
                
        )//Overaly
        
        
     }
}

//MARK: Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
