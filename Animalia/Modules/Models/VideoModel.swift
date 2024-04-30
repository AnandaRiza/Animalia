//
//  VideoModel.swift
//  Animalia
//
//  Created by MACBOOK PRO on 30/04/24.
//

import Foundation

struct VideoModel: Codable, Identifiable {
    var id: String
    var name: String
    var headline: String
    
    
    
    //computed property
    
    var thumbnail: String {
        "video-\(id)"
    }
    
    
    
}
