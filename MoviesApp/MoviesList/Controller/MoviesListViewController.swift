//
//  MovieListViewController.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 03/03/22.
//

import UIKit

final class MoviesListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, MovieListCellDelegate {
    
    var api: MovieAPI = .init()
    
    var movies: [Movie] = []
    
    init(api: MovieAPI = MovieAPI()) {
        self.api = api
        super.init(nibName: nil, bundle: nil)
        self.title = "Movies"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func favoriteButtonAction(index: Int) {
        let favoriteMovie: Movie = movies[index]
        var favoriteMovies: [Movie] = MovieManager.getFavoriteMovies()
        if MovieManager.isMovieFavorite(favoriteMovie) {
            if let favoriteIndex: Int = MovieManager.getFavoriteIndex(id: favoriteMovie.id) {
                favoriteMovies.remove(at: favoriteIndex)
            }
        } else {
            favoriteMovies.append(favoriteMovie)
        }
        
        MovieManager.updateFavoriteMovies(movies: favoriteMovies)
    }
    
    
    lazy var moviesListView: MovieListView = .init(collectionViewMoviesDataSource: self, collectionViewMoviesDelegate: self)
    
    override func loadView() {
        view = moviesListView
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: MoviesListViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCell", for: indexPath) as? MoviesListViewCell else {
            return UICollectionViewCell()
        }
        let movie: Movie = movies[indexPath.item]
        let isFavorite: Bool = MovieManager.isMovieFavorite(movie)
        cell.setupCell(posterImage: movie.posterImageURL, title: movie.title, isFavorite: isFavorite, delegate: self, index: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie: Movie = movies[indexPath.item]
        api.getMoviesDetail(id: selectedMovie.id) { MovieDetail in
            selectedMovie.detail = MovieDetail
        }
        let details = MovieDetailViewController(movie: selectedMovie)
            self.navigationController?.pushViewController(details, animated: true)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        api.getMovies { movieResponse in
            DispatchQueue.main.async {
                self.movies = movieResponse?.items ?? []
                self.moviesListView.collectionViewListMovies.reloadData()
            }
        }
    }
}
