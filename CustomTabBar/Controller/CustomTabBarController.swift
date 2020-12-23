//
//  CustomTabBarController.swift
//  CustomTabBar
//
//  Created by Failyn Kaye M. Sedik on 12/23/20.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    private lazy var tabBarViewControllers: [UIViewController] = {
        let favoritesVC: FavoritesViewController = FavoritesViewController()
        favoritesVC.tabBarItem = UITabBarItem(
            title: "Favorites",
            image: UIImage(systemName: "star"),
            selectedImage: UIImage(systemName: "star.fill")
        )
        
        let recentsVC: RecentsViewController = RecentsViewController()
        recentsVC.tabBarItem = UITabBarItem(
            title: "Recents",
            image: UIImage(systemName: "clock"),
            selectedImage: UIImage(systemName: "clock.fill")
        )
        
        return [favoritesVC, recentsVC]
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set tab bar's VCs
        setViewControllers(tabBarViewControllers, animated: true)
        
        // Set initially selected VC
        selectedIndex = 0
    }
    
}
