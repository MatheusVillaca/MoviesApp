//
//  AppDelegate.swift
//  MoviesApp
//
//  Created by Matheus Villaça on 03/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window: UIWindow = .init(frame: UIScreen.main.bounds)
        
        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backgroundColor = .orange
        navAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = .white
        
        let barAppearance = UITabBarAppearance()
        barAppearance.configureWithOpaqueBackground()
        barAppearance.backgroundColor = .orange
        barAppearance.selectionIndicatorTintColor = .white

        let tabViewController: TabBarController = .init()
        tabViewController.tabBar.barTintColor = .orange
        tabViewController.tabBar.standardAppearance = barAppearance;
        if #available(iOS 15.0, *) {
            UINavigationBar.appearance().standardAppearance = navAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
            tabViewController.tabBar.scrollEdgeAppearance = tabViewController.tabBar.standardAppearance
        }
        tabViewController.tabBar.tintColor = .white
        tabViewController.tabBar.unselectedItemTintColor = .white
        
        window.rootViewController = tabViewController
        self.window = window
        window.makeKeyAndVisible()
        return true
    }


}

