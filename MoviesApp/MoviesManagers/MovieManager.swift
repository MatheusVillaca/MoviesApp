//
//  Manager.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 07/03/22.
//

import Foundation


final class MovieManager {
    
    static func getFavoriteMovies() -> [Movie] {
        guard let favoriteMoviesData: Data = UserDefaults.standard.value(forKey: "favoriteMovies") as? Data,
              let favoriteMovies: [Movie] = try? JSONDecoder().decode([Movie].self, from: favoriteMoviesData) else {
                  return []
              }
        return favoriteMovies
    }
    
    static func updateFavoriteMovies(movies: [Movie]) {
        if let updatedFavoriteMoviesData: Data = try? JSONEncoder().encode(movies) {
            UserDefaults.standard.setValue(updatedFavoriteMoviesData, forKey: "favoriteMovies")
        }
    }
    
    static func isMovieFavorite(_ movie: Movie) -> Bool {
        let favoriteMovies: [Movie] = getFavoriteMovies()
        return !favoriteMovies.filter({ movie == $0 }).isEmpty
    }
    
    static func isMovieFavorite(_ id: String) -> Bool {
        let favoriteMovies: [Movie] = getFavoriteMovies()
        return !favoriteMovies.filter({ id == $0.id }).isEmpty
    }
    
    static func getFavoriteIndex(id: String) -> Int? {
        let favoriteMovies: [Movie] = getFavoriteMovies()
        guard let movie: Movie = favoriteMovies.first(where: { $0.id == id }) else { return nil }
        return favoriteMovies.firstIndex(of: movie)
    }
    
    static func remove(at index: Int) {
        var favoriteMovies: [Movie] = getFavoriteMovies()
        favoriteMovies.remove(at: index)
        updateFavoriteMovies(movies: favoriteMovies)
    }
    
    static func remove(movie: Movie) {
        guard let favoriteIndex = getFavoriteIndex(id: movie.id) else { return }
        remove(at: favoriteIndex)
    }
    
    static func addFavorite(movie: Movie) {
        var favoriteMovies: [Movie] = getFavoriteMovies()
        favoriteMovies.append(movie)
        updateFavoriteMovies(movies: favoriteMovies)
    }

}
