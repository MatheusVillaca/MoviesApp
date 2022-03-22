//
//  MovieDetailCell.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 03/03/22.
//

import UIKit
import Kingfisher

final class ActorCollectionViewCell: UICollectionViewCell, ViewCode {
    
    var actorPhotoImage: UIImageView = {
        var actorPhotoImage: UIImageView = UIImageView(frame: .zero)
        actorPhotoImage.translatesAutoresizingMaskIntoConstraints = false
        return actorPhotoImage
    } ()
    
    var actorNameLabel: UILabel = {
        var actorNameLabel: UILabel = UILabel(frame: .zero)
        actorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        actorNameLabel.numberOfLines = 2
        actorNameLabel.font = actorNameLabel.font.withSize(12)
        return actorNameLabel
    } ()
    
    func setupDetailCell(actorPhoto: URL?, actorName: String) {
        self.actorNameLabel.text = actorName
        self.actorPhotoImage.kf.setImage(with: actorPhoto)
        setupView()
    }
    
    func setupViewHierarchy() {
        contentView.addSubview(actorNameLabel)
        contentView.addSubview(actorPhotoImage)
    }
    
    func setupConstraints() {
        
        actorPhotoImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        actorPhotoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        actorPhotoImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        actorPhotoImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        actorNameLabel.topAnchor.constraint(equalTo: actorPhotoImage.bottomAnchor, constant: -4).isActive = true
        actorNameLabel.centerXAnchor.constraint(equalTo: actorPhotoImage.centerXAnchor).isActive = true
        actorNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func configureViews() {
        backgroundColor = .none
        self.actorPhotoImage.clipsToBounds = true
        self.actorPhotoImage.layer.cornerRadius = 25
    }
}
