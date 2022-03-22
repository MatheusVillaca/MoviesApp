//
//  MovieDetailViewController.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 03/03/22.
//

import UIKit

enum DetailCellType: Int, CaseIterable {
    case poster = 0, headline, actors, synopsis
}

final class MovieDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var movie: Movie
    
    var api: MovieAPI = .init()
    
    var isFavorite: Bool = false
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "normalFavoriteButton"), style: .plain, target: self, action: #selector(actionDetailFavoriteButton))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var moviesDetailView: MovieDetailView = .init(detailTableViewDelegate: self, detailTableViewDataSource: self)
   
    override func loadView() {
        view = moviesDetailView
        view.backgroundColor = .white
        self.title = movie.title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DetailCellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType: DetailCellType = .init(rawValue: indexPath.row) else { return UITableViewCell() }
        
        switch cellType {
        case .poster:
            return getPosterCell(tableView, for: indexPath)
        case .headline:
            return getHeadlineCell(tableView, for: indexPath)
        case .actors:
            return getActorsCell(tableView, for: indexPath)
        case .synopsis:
            return getSynopsisCell(tableView, for: indexPath)
        }
        
    }
    
    func getPosterCell(_ tableView: UITableView, for indexPath: IndexPath) -> PosterCell {
        guard let posterCell: PosterCell = tableView.dequeueReusableCell(withIdentifier: "posterCell", for: indexPath) as? PosterCell else {
            return PosterCell()
        }
        posterCell.setupCell(poster: movie.posterImageURL)
        return posterCell
    }
    
    func getHeadlineCell(_ tableView: UITableView, for indexPath: IndexPath) -> HeadLineCell {
        guard let headlineCell: HeadLineCell = tableView.dequeueReusableCell(withIdentifier: "headlineCell", for: indexPath) as? HeadLineCell else {
            return HeadLineCell()
        }
        headlineCell.setupCell(title: movie.title, parental: movie.detail?.parentalRating ?? "", genre: "Genre: \(movie.detail?.genre ?? "")", imdb: "Imdb: \(movie.detail?.score ?? "")", release: movie.detail?.releaseYear ?? "")
        return headlineCell
    }
    
    func getActorsCell(_ tableView: UITableView, for indexPath: IndexPath) -> ActorsTableViewCell {
        guard let actorsCell: ActorsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "actorsCell", for: indexPath) as? ActorsTableViewCell else {
            return ActorsTableViewCell()
        }
        actorsCell.setupCell(collectionViewDetailDataSource: self, collectionViewDetailDelegate: self)
        return actorsCell
    }
    func getSynopsisCell(_ tableView: UITableView, for indexPath: IndexPath) -> SynopsisCell {
        guard let sinopseCell: SynopsisCell = tableView.dequeueReusableCell(withIdentifier: "sinopseCell", for: indexPath) as? SynopsisCell else {
            return SynopsisCell()
        }
        sinopseCell.setupCell(synopsis: movie.detail?.synopsis ?? "")
        return sinopseCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.detail?.actors.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: ActorCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "actorDetailCell", for: indexPath) as? ActorCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let actor: Actor = movie.detail?.actors[indexPath.item] {
            cell.setupDetailCell(actorPhoto: actor.photo , actorName: actor.name)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: 100)
    }
    @objc func actionDetailFavoriteButton() {
        isFavorite.toggle()
        changeImageButton()
        
        if MovieManager.isMovieFavorite(movie) {
            MovieManager.remove(movie: movie)
        } else {
            MovieManager.addFavorite(movie: movie)
        }
    }
    
    
    func changeImageButton() {
        switch isFavorite {
        case true:
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "selectedFavoriteButton"), style: .plain, target: self, action: #selector(actionDetailFavoriteButton))

        default:
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "normalFavoriteButton"), style: .plain, target: self, action: #selector(actionDetailFavoriteButton))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isFavorite = MovieManager.isMovieFavorite(movie)
        changeImageButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getMoviesDetail(id: movie.id) { movieDetail in
            DispatchQueue.main.async {
                self.moviesDetailView.detailTableView.reloadData()
            }
        }
    }
}
