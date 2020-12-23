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
        
        // Set the tabBar to be the `CustomTabBar`. I am only doing this
        // way of overriding the tabBar on this sample project but this
        // should not be done on a prod app for the following reason:
        //
        // "This works, but there's a chance you might not pass
        // App Store review because it's setting a value that public
        // API doesn't allow you to set."
        //
        // REF: https://stackoverflow.com/a/59846917
        let customTabBar: CustomTabBar = CustomTabBar(frame: CGRect.zero)
        customTabBar.delegate = self
        setValue(customTabBar, forKey: "tabBar")
    }
    
}
