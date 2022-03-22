//
//  PosterCell.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 08/03/22.
//

import UIKit
import Kingfisher

final class PosterCell: UITableViewCell, ViewCode {
   
    var posterDetailImage: UIImageView = {
        var posterDetailImage: UIImageView = UIImageView(frame: .zero)
        posterDetailImage.translatesAutoresizingMaskIntoConstraints = false
        return posterDetailImage
    } ()
    
    func setupViewHierarchy() {
        contentView.addSubview(posterDetailImage)
    }
    
    func setupConstraints() {
        posterDetailImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        posterDetailImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        posterDetailImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        posterDetailImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        posterDetailImage.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    func configureViews() {
        backgroundColor = .none
    }
    
    func setupCell(poster: URL?) {
        self.posterDetailImage.kf.setImage(with: poster)
        setupView()
    }
    
}
