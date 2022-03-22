//
//  Actors.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 03/03/22.
//

import Foundation

final class Actor: Codable {
    
    var photo: URL?
    var name: String
    
    private enum CodingKeys: String, CodingKey {
        case photo = "image"
        case name = "name"
    }
    
    init(photo: URL, name: String) {
        self.photo = photo
        self.name = name
    }
}
