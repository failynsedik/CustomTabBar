//
//  NSLayoutConstraint+Shortcuts.swift
//  CustomTabBar
//
//  Created by Failyn Kaye M. Sedik on 12/28/20.
//

import UIKit

/// `NSLayoutConstraint` extension for all constraint-related shortcut methods to make constraint implementation simpler and lesser.
extension NSLayoutConstraint {
    
    /// Activates the constraints and also disables `translatesAutoresizingMaskIntoConstraints`.
    static func make(_ constraints: [NSLayoutConstraint]) {
        constraints.forEach({
            ($0.firstItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
            $0.isActive = true
        })
    }
    
}
