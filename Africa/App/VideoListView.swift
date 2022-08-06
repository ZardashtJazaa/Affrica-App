//
//  VideoView.swift
//  Africa
//
//  Created by Zardasht on 7/30/22.
//

import SwiftUI

struct VideoListView: View {
    //MARK: Properety
    @State var video: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    //MARK: Body
    var body: some View {
        NavigationView {
            List {
                ForEach(video) {item in
                    NavigationLink(destination:VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListViewItems(video: item)
                            .padding(.vertical,8)
                    }
                }//Loop
            }//List
            
            .navigationBarTitle("Videos",displayMode: .inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action:{
                        video.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }//Navigation
        
    }
    
}
//MARK: Preview
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
