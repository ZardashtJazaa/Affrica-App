//
//  VideoListView.swift
//  Africa
//
//  Created by Zardasht on 8/1/22.
//

import SwiftUI

struct VideoListViewItems: View {
    //MARK: Properety
    let video: Video
    //MARK: Body
    var body: some View {
        HStack {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height:80)
                    .cornerRadius(9)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height:32)
                    .shadow(radius: 4)
            }//ZStack
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .foregroundColor(.accentColor)
                    .font(.title2)
                    .fontWeight(.heavy)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    
            }//VStack
        }//HStack
        
    }
}
//MARK: Preview
struct VideoListViewItems_Previews: PreviewProvider {
    static let video: [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListViewItems(video: video[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
