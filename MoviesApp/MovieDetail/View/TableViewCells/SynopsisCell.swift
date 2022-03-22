//
//  SinopseCell.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 08/03/22.
//

import UIKit

final class SynopsisCell: UITableViewCell, ViewCode {
 
    var synopsis: UILabel = {
        var synopsis: UILabel = UILabel(frame: .zero)
        synopsis.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 15)
        synopsis.text = "Plot:"
        synopsis.translatesAutoresizingMaskIntoConstraints = false
        return synopsis
    } ()
    
    var synopsisLabel: UILabel = {
        var synopsisLabel: UILabel = UILabel(frame: .zero)
        synopsisLabel.numberOfLines = 0
        synopsisLabel.translatesAutoresizingMaskIntoConstraints = false
        return synopsisLabel
    } ()
    
    func setupViewHierarchy() {
        contentView.addSubview(synopsisLabel)
        contentView.addSubview(synopsis)
    }
    
    func setupConstraints() {
        
        synopsis.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        synopsis.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        
        synopsisLabel.topAnchor.constraint(equalTo: synopsis.bottomAnchor, constant: 5).isActive = true
        synopsisLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        synopsisLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        synopsisLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    func configureViews() {
        backgroundColor = .none
    }
    
    func setupCell(synopsis: String) {
        self.synopsisLabel.text = synopsis
        setupView()
    }
}
