//
//  ViewCode.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 21/03/22.
//

import Foundation

protocol ViewCode {
    func setupViewHierarchy()
    func setupConstraints()
    func configureViews()
    func setupView()
}

extension ViewCode {
    func setupView() {
        setupViewHierarchy()
        setupConstraints()
        configureViews()
    }
}
