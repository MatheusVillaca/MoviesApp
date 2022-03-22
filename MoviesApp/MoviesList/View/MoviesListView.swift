//
//  MoviesListView.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 03/03/22.
//

import UIKit

final class MovieListView: UIView, ViewCode {
    
//    let activityIndicator: UIActivityIndicatorView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        return $0
//    }(UIActivityIndicatorView(style: .large))
    
    let collectionViewListMovies: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 5, height: UIScreen.main.bounds.width / 2 * 1.6)
        flowLayout.scrollDirection = .vertical
        let collectionViewListMovies = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionViewListMovies.register(MoviesListViewCell.self, forCellWithReuseIdentifier: "moviesCell")
        collectionViewListMovies.translatesAutoresizingMaskIntoConstraints = false
        collectionViewListMovies.contentInset = .init(top: 8, left: 0, bottom: 8, right: 0)
        return collectionViewListMovies
    } ()
    
    init (collectionViewMoviesDataSource: UICollectionViewDataSource, collectionViewMoviesDelegate: UICollectionViewDelegate) {
        super.init(frame: .zero)
        self.collectionViewListMovies.delegate = collectionViewMoviesDelegate
        self.collectionViewListMovies.dataSource = collectionViewMoviesDataSource
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViewHierarchy() {
        addSubview(collectionViewListMovies)
//        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        collectionViewListMovies.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        collectionViewListMovies.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionViewListMovies.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionViewListMovies.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
//        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func configureViews() {
        backgroundColor = .white
//        activityIndicator.color = .black
//        activityIndicator.hidesWhenStopped = true
//        activityIndicator.startAnimating()
    }
    
    
    
}
