//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Zardasht on 8/1/22.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: Properety
    var videoSelected: String
    var videoTitle: String
    //MARK: Body
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
             
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top,4)
                    .padding(.horizontal,8)
                ,alignment: .topLeading
            
            )
        }//:VStack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle,displayMode: .inline)
    }//:Body
}


//MARK: Preview
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
