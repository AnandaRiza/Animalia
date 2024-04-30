//
//  AnimalModel.swift
//  Animalia
//
//  Created by MACBOOK PRO on 29/04/24.
//

import Foundation

struct AnimalModel: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
    
}
