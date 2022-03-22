//
//  TabBarController.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 03/03/22.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let movieListController = MoviesListViewController()
        let listNavigationController: CustomNavigationController = .init(rootViewController: movieListController)
        
        let movieListBarItem = UITabBarItem ( title: "Movies" , image: UIImage ( named: "movies" ) , selectedImage: UIImage ( named: "movies" ))
        movieListController.tabBarItem = movieListBarItem
        
        let favoriteMoviesController = FavoriteMoviesController()
        let favoriteNavigationController: CustomNavigationController = .init(rootViewController: favoriteMoviesController)
        let movieFavoriteBarItem = UITabBarItem (title: "Favorite Movies", image: UIImage(named: "favoriteMovies"), selectedImage: UIImage(named: "favoriteMovies"))
        favoriteMoviesController.tabBarItem = movieFavoriteBarItem
        
        listNavigationController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        favoriteMoviesController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.viewControllers = [listNavigationController, favoriteNavigationController]
    }
    
}
