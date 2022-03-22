//
//  MovieDetailsView.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 03/03/22.
//

import UIKit

final class MovieDetailView: UIView, ViewCode {
    
    var detailTableView: UITableView = {
        var detailTableView: UITableView = UITableView(frame: .zero)
        detailTableView.separatorStyle = .none
        detailTableView.register(PosterCell.self, forCellReuseIdentifier: "posterCell")
        detailTableView.register(HeadLineCell.self, forCellReuseIdentifier: "headlineCell")
        detailTableView.register(ActorsTableViewCell.self, forCellReuseIdentifier: "actorsCell")
        detailTableView.register(SynopsisCell.self, forCellReuseIdentifier: "sinopseCell")
        detailTableView.translatesAutoresizingMaskIntoConstraints = false
        return detailTableView
    } ()
    
    init (detailTableViewDelegate: UITableViewDelegate, detailTableViewDataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        self.detailTableView.dataSource = detailTableViewDataSource
        self.detailTableView.delegate = detailTableViewDelegate
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy() {
        addSubview(detailTableView)
    }
    
    func setupConstraints() {
        detailTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        detailTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        detailTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        detailTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    func configureViews() {
        backgroundColor = .white
    }
    
}
