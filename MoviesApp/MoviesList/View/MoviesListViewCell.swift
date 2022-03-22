//
//  MoviesListViewCell.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 03/03/22.
//

import UIKit
import Kingfisher

protocol MovieListCellDelegate {
    func favoriteButtonAction(index: Int)
}

final class MoviesListViewCell: UICollectionViewCell, ViewCode {
    
    var isFavorite: Bool = false
    
    var index: Int = 0
    
    var posterImage: UIImageView = {
        let posterImage: UIImageView = UIImageView(frame: .zero)
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        return posterImage
    } ()
    
    var titleLabel: UILabel = {
        let titleLabel: UILabel = UILabel(frame: .zero)
        titleLabel.font = titleLabel.font.withSize(18)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.backgroundColor = .gray.withAlphaComponent(0.5)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    } ()
    
    let favoriteMovieButton: UIButton = {
        let favoriteMovieButton: UIButton = UIButton(type: .custom)
        favoriteMovieButton.addTarget(self, action: #selector(favoriteActionButton), for: .touchUpInside)
        favoriteMovieButton.setImage(UIImage(named: "normalFavoriteButton"), for: .normal)
        favoriteMovieButton.translatesAutoresizingMaskIntoConstraints = false
        return favoriteMovieButton
    } ()
    
    var delegate: MovieListCellDelegate?
    
    func setupCell(posterImage: URL?, title: String, isFavorite: Bool, delegate: MovieListCellDelegate, index: Int) {
        self.posterImage.kf.setImage(with: posterImage)
        self.titleLabel.text = title
        self.isFavorite = isFavorite
        self.delegate = delegate
        self.index = index
        setupView()
    }
    
    func setupViewHierarchy() {
        addSubview(posterImage)
        addSubview(titleLabel)
        addSubview(favoriteMovieButton)
    }
    
    func setupConstraints() {
        posterImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        posterImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        posterImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        posterImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: posterImage.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: posterImage.trailingAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        favoriteMovieButton.topAnchor.constraint(equalTo: posterImage.topAnchor, constant: 8).isActive = true
        favoriteMovieButton.trailingAnchor.constraint(equalTo: posterImage.trailingAnchor, constant: -8).isActive = true
        favoriteMovieButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        favoriteMovieButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func configureViews() {
        backgroundColor = .white
        changeStatusFavoriteButton()
    }
    
    @objc func favoriteActionButton() {
        isFavorite.toggle()
        changeStatusFavoriteButton()
        delegate?.favoriteButtonAction(index: index)
    }
    
    func changeStatusFavoriteButton() {
        switch isFavorite {
        case true:
            favoriteMovieButton.setImage(UIImage(named: "selectedFavoriteButton"), for: .normal)
        default:
            favoriteMovieButton.setImage(UIImage(named: "normalFavoriteButton"), for: .normal)
        }
    }
    
    
}
