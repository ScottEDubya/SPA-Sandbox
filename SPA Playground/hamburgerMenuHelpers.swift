//
//  hamburgerMenuHelpers.swift
//  SPA Playground
//
//  Created by Scott Williams on 9/18/17.
//  Copyright © 2017 Scott Williams. All rights reserved.
//

import UIKit

///This class contains all of the helper functions for the hamburger menu in the main view
class HamburgerMenuHelpers: NSObject {
    
    let blackenedView = UIView();
    
    func setUpMenuView(_ view: UIView, _ hamburgerMenuView: UIView, _ leadingConstraint: NSLayoutConstraint) {
        //blacken background
        self.blackenedView.backgroundColor = UIColor(white: 0, alpha: 0.5);
        self.blackenedView.alpha = 0;
        
        //add blackened view to this page's view
        view.addSubview(self.blackenedView);
        self.blackenedView.frame = CGRect(x: 160, y: 0, width: view.frame.width - 160, height: view.frame.height);
        UIView.animate(withDuration: 0.75) {
            self.blackenedView.alpha = 1;
        };
        
        //attach a handler to the blackened view to remove it
        self.blackenedView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleBackgroundDismiss)));
        
        if (leadingConstraint.constant == 0) {
            //hide the menu
            hamburgerMenuView.layer.shadowOpacity = 0;
            leadingConstraint.constant = -160;
            handleBackgroundDismiss();
            UIView.animate(withDuration: 0.15) {
                view.layoutIfNeeded()
            };
        }
        else {
            //show the menu
            hamburgerMenuView.layer.shadowOpacity = 1;
            leadingConstraint.constant = 0;
            UIView.animate(withDuration: 0.3) {
                view.layoutIfNeeded()
            };
        }
    }
    
    func handleBackgroundDismiss() {
        UIView.animate(withDuration: 0.1) {
            self.blackenedView.alpha = 0;
        }
    }
    
    override init() {
        super.init();
    }
}
