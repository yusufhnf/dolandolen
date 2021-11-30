//
//  TabbarViewController.swift
//  dolandolen
//
//  Created by Yusuf Umar Hanafi on 11/08/21.
//

import UIKit

class TabbarViewController: UITabBarController {
    let scene = UIApplication.shared.connectedScenes.first
    private lazy var home: UIViewController = {
        if let sceneDelegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
            let container = sceneDelegate.container
            let viewController = container.resolve(HomeViewController.self)!
            let image = UIImage(systemName: "house")
            let selectedImage = UIImage(systemName: "house.fill")
            viewController.tabBarItem = UITabBarItem(title: "Beranda", image: image, selectedImage: selectedImage)
            return UINavigationController(rootViewController: viewController)
        }
        return UINavigationController()
    }()
    private lazy var about: UIViewController = {
        let viewController = AboutViewController()
        let image = UIImage(systemName: "info.circle")
        let selectedImage = UIImage(systemName: "info.circle.fill")
        viewController.tabBarItem = UITabBarItem(title: "Tentang", image: image, selectedImage: selectedImage)
        return UINavigationController(rootViewController: viewController)
        
    }()
    private lazy var search: UIViewController = {
        if let sceneDelegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
            let container = sceneDelegate.container
            let viewController = container.resolve(SearchViewController.self)!
            let image = UIImage(systemName: "magnifyingglass.circle")
            let selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
            viewController.tabBarItem = UITabBarItem(title: "Cari", image: image, selectedImage: selectedImage)
            return UINavigationController(rootViewController: viewController)
        }
        return UINavigationController()
    }()
    private lazy var favourites: UIViewController = {
        if let sceneDelegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
            let container = sceneDelegate.container
            let viewController = container.resolve(FavoritesViewController.self)!
            let image = UIImage(systemName: "heart.text.square")
            let selectedImage = UIImage(systemName: "heart.text.square.fill")
            viewController.tabBarItem = UITabBarItem(title: "Favorit", image: image, selectedImage: selectedImage)
            return UINavigationController(rootViewController: viewController)
        }
        return UINavigationController()
    }()
    private func setupTabBar() {
        self.viewControllers = [home, search, favourites, about]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
