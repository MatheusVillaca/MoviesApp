//
//  FavoriteMoviesViewController.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 03/03/22.
//

import UIKit

final class FavoriteMoviesController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, MovieListCellDelegate {
    
    var api = MovieAPI()
    
    var favoriteMovies: [Movie] {
        return MovieManager.getFavoriteMovies()
    }
    
    func favoriteButtonAction(index: Int) {
        MovieManager.remove(at: index)
        moviesListView.collectionViewListMovies.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        moviesListView.collectionViewListMovies.reloadData()
    }
    
    lazy var moviesListView: MovieListView = .init(collectionViewMoviesDataSource: self, collectionViewMoviesDelegate: self)
    
    override func loadView() {
        view = moviesListView
        view.backgroundColor = .orange
        self.title = "Favorites"
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: MoviesListViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCell", for: indexPath) as? MoviesListViewCell else {
            return UICollectionViewCell()
        }
        let favoriteMovie: Movie = favoriteMovies[indexPath.item]
        let isFavorite: Bool = MovieManager.isMovieFavorite(favoriteMovie)
        cell.setupCell(posterImage: favoriteMovie.posterImageURL, title: favoriteMovie.title, isFavorite: isFavorite, delegate: self, index: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie: Movie = favoriteMovies[indexPath.item]
        api.getMoviesDetail(id: selectedMovie.id) { MovieDetail in
            selectedMovie.detail = MovieDetail
            let details = MovieDetailViewController(movie: selectedMovie)
            self.navigationController?.pushViewController(details, animated: true)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let updatedFavoriteMovies: Data = try? JSONEncoder().encode(favoriteMovies) {
            UserDefaults.standard.setValue(updatedFavoriteMovies, forKey: "favoriteMovies")
        }
    
    }
}
