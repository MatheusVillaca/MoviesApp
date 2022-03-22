//
//  HeadlineCell.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 08/03/22.
//

import UIKit

final class HeadLineCell: UITableViewCell, ViewCode {
    
    var titleDetailLabel: UILabel = {
        var titleDetailLabel: UILabel = UILabel(frame: .zero)
        titleDetailLabel.font = titleDetailLabel.font.withSize(30)
        titleDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleDetailLabel
    } ()
    
    var parentalRatingDetailLabel: UILabel = {
        var parentalRatingDetailLabel: UILabel = UILabel(frame: .zero)
        parentalRatingDetailLabel.font = parentalRatingDetailLabel.font.withSize(15)
        parentalRatingDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        return parentalRatingDetailLabel
    } ()
    
    var backgroundParentalRating: UIView = {
        var backgroundParentalRating: UIView = UIView(frame: .zero)
        backgroundParentalRating.layer.cornerRadius = 5
        backgroundParentalRating.layer.borderWidth = 1
        backgroundParentalRating.translatesAutoresizingMaskIntoConstraints = false
        return backgroundParentalRating
    } ()
    
    var genreDetailLabel: UILabel = {
        var genreDetailLabel: UILabel = UILabel(frame: .zero)
        genreDetailLabel.font = genreDetailLabel.font.withSize(15)
        genreDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        return genreDetailLabel
    } ()
    
    var imdbRankingLabel: UILabel = {
        var imdbRankingLabel: UILabel = UILabel(frame: .zero)
        imdbRankingLabel.font = imdbRankingLabel.font.withSize(20)
        imdbRankingLabel.translatesAutoresizingMaskIntoConstraints = false
        return imdbRankingLabel
    } ()
    
    var releaseYearLabel: UILabel = {
        var releaseYearLabel: UILabel = UILabel(frame: .zero)
        releaseYearLabel.font = releaseYearLabel.font.withSize(20)
        releaseYearLabel.translatesAutoresizingMaskIntoConstraints = false
        return releaseYearLabel
    } ()
    
    func setupViewHierarchy() {
        contentView.addSubview(titleDetailLabel)
        contentView.addSubview(imdbRankingLabel)
        contentView.addSubview(releaseYearLabel)
        contentView.addSubview(backgroundParentalRating)
        contentView.addSubview(parentalRatingDetailLabel)
        contentView.addSubview(genreDetailLabel)
    }
    
    func setupConstraints() {
        titleDetailLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleDetailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        titleDetailLabel.trailingAnchor.constraint(equalTo: imdbRankingLabel.leadingAnchor, constant: -50).isActive = true
        
        backgroundParentalRating.heightAnchor.constraint(equalToConstant: 30).isActive = true
        backgroundParentalRating.widthAnchor.constraint(equalToConstant: 50).isActive = true
        backgroundParentalRating.topAnchor.constraint(equalTo: titleDetailLabel.bottomAnchor, constant: 4).isActive = true
        backgroundParentalRating.leadingAnchor.constraint(equalTo: titleDetailLabel.leadingAnchor, constant: 4).isActive = true

        parentalRatingDetailLabel.centerXAnchor.constraint(equalTo: backgroundParentalRating.centerXAnchor).isActive = true
        parentalRatingDetailLabel.centerYAnchor.constraint(equalTo: backgroundParentalRating.centerYAnchor).isActive = true
        
        genreDetailLabel.topAnchor.constraint(equalTo: titleDetailLabel.bottomAnchor, constant: 10).isActive = true
        genreDetailLabel.leadingAnchor.constraint(equalTo: parentalRatingDetailLabel.trailingAnchor, constant: 15).isActive = true
        genreDetailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
        
        imdbRankingLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imdbRankingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        
        releaseYearLabel.topAnchor.constraint(equalTo: imdbRankingLabel.bottomAnchor, constant: 4).isActive = true
        releaseYearLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        releaseYearLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4).isActive = true
    }
    
    func configureViews() {
        parentalRatingColor()
    }
    
    func setupCell(title: String, parental: String, genre: String, imdb: String, release: String) {
        self.titleDetailLabel.text = title
        self.parentalRatingDetailLabel.text = parental
        self.genreDetailLabel.text = genre
        self.imdbRankingLabel.text = imdb
        self.releaseYearLabel.text = release
        setupView()
    }
    
    func parentalRatingColor() {
        if parentalRatingDetailLabel.text == "G" {
            backgroundParentalRating.backgroundColor = .green
            backgroundParentalRating.widthAnchor.constraint(equalToConstant: 30).isActive = true
            parentalRatingDetailLabel.textColor = .white
        } else if parentalRatingDetailLabel.text == "PG" {
            backgroundParentalRating.backgroundColor = .white
            backgroundParentalRating.widthAnchor.constraint(equalToConstant: 30).isActive = true
            parentalRatingDetailLabel.textColor = .black
        } else if parentalRatingDetailLabel.text == "PG-13" {
            backgroundParentalRating.backgroundColor = .purple
            parentalRatingDetailLabel.textColor = .white
        } else if parentalRatingDetailLabel.text == "TV-14" {
            backgroundParentalRating.backgroundColor = .red
            parentalRatingDetailLabel.textColor = .white
        } else if parentalRatingDetailLabel.text == "NC-17" {
            backgroundParentalRating.backgroundColor = .black
            parentalRatingDetailLabel.textColor = .white
        } else if parentalRatingDetailLabel.text == "NR" {
            backgroundParentalRating.backgroundColor = .black
            backgroundParentalRating.widthAnchor.constraint(equalToConstant: 30).isActive = true
            parentalRatingDetailLabel.textColor = .white
        } else if parentalRatingDetailLabel.text == "R" {
            backgroundParentalRating.backgroundColor = .black
            backgroundParentalRating.widthAnchor.constraint(equalToConstant: 30).isActive = true
            parentalRatingDetailLabel.textColor = .white
        }
    }
}
