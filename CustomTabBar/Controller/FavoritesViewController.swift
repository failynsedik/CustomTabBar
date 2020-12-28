//
//  FavoritesViewController.swift
//  CustomTabBar
//
//  Created by Failyn Kaye M. Sedik on 12/23/20.
//

import UIKit

final class FavoritesViewController: UIViewController {
    
    // MARK: - View Properties
    
    /// Added to verify `addButton`'s tap functionality.
    private let label: UILabel = {
        let label: UILabel = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 54, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let addButton: UIButton = {
        let button: UIButton = UIButton()
        let attributedTitle: NSAttributedString = NSAttributedString(
            string: "+", attributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32, weight: .regular),
                NSAttributedString.Key.foregroundColor: UIColor.darkGray
            ]
        )
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 35
        button.clipsToBounds = true
        button.addTarget(
            self, action: #selector(didTapAddButton),
            for: .touchUpInside
        )
        return button
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Additional Views/Subviews Setup
        view.backgroundColor = .systemBlue
        
        // MARK: Subviews
        view.addSubview(label)
        view.addSubview(addButton)
        
        // MARK: Constraints Setup
        NSLayoutConstraint.make([
            // Label
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // "+" Button
            addButton.widthAnchor.constraint(equalToConstant: 70),
            addButton.heightAnchor.constraint(equalToConstant: 70),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard let tabBar = tabBarController?.tabBar else { return }
        
        // MARK: Constraints Setup
        NSLayoutConstraint.make([
            addButton.centerYAnchor.constraint(equalTo: tabBar.topAnchor, constant: -6)
        ])
    }
    
}

// MARK: - Selectors

extension FavoritesViewController {
    
    @objc private func didTapAddButton() {
        guard var count = Int(label.text ?? "0") else {
            print("Error")
            return
        }
        
        count += 1
        label.text = "\(count)"
    }
    
}
