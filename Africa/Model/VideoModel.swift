//
//  VideoModel.swift
//  Africa
//
//  Created by Zardasht on 8/1/22.
//

import Foundation

struct Video:Identifiable,Codable {
    let id: String
    let name:String
    let headline:String

    
    var thumbnail:String {
        return "video-\(id)"
    }

}
