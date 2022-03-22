//
//  Movie.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 03/03/22.
//

import Foundation

final class Movie: Codable, Equatable {
    
    var posterImageURL: URL?
    var title: String
    var id: String
    var isFavorite: Bool {
        return MovieManager.isMovieFavorite(id)
    }
    var detail: MovieDetail?
    
    private enum CodingKeys: String, CodingKey {
        case posterImageURL = "image"
        case title, id, detail
    }
    
    init(imageURL: URL?, title: String, id: String, detail: MovieDetail?) {
        self.posterImageURL = imageURL
        self.title = title
        self.id = id
        self.detail = detail
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.posterImageURL = try container.decodeIfPresent(URL.self, forKey: .posterImageURL)
        self.title = try container.decode(String.self, forKey: .title)
        let movieID = try container.decode(String.self, forKey: .id)
        self.id = movieID
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
}
