//
//  DetailTableViewCell.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 08/03/22.
//

import UIKit


final class ActorsTableViewCell: UITableViewCell, ViewCode {
    
    var cast: UILabel = {
        var cast: UILabel = UILabel(frame: .zero)
        cast.translatesAutoresizingMaskIntoConstraints = false
        cast.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 15)
        cast.text = "Cast:"
        return cast
    } ()
   
    var actorsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let actorsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        actorsCollectionView.backgroundColor = .none
        actorsCollectionView.register(ActorCollectionViewCell.self, forCellWithReuseIdentifier: "actorDetailCell")
        actorsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return actorsCollectionView
    } ()
    
    func setupCell(collectionViewDetailDataSource: UICollectionViewDataSource, collectionViewDetailDelegate: UICollectionViewDelegate ) {
        self.actorsCollectionView.delegate = collectionViewDetailDelegate
        self.actorsCollectionView.dataSource = collectionViewDetailDataSource
        setupView()
        actorsCollectionView.reloadData()
    }
    
    
    func setupViewHierarchy() {
        contentView.addSubview(actorsCollectionView)
        contentView.addSubview(cast)
        
    }
    
    func setupConstraints() {
        cast.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        cast.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        
        actorsCollectionView.topAnchor.constraint(equalTo: cast.bottomAnchor, constant: 5).isActive = true
        actorsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        actorsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        actorsCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        actorsCollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func configureViews() {
        backgroundColor = .white
    }
    
}
