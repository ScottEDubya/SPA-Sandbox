//
//  ViewController.swift
//  SPA Playground
//
//  Created by Scott Williams on 9/17/17.
//  Copyright © 2017 Scott Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameInputField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var hamburgerMenuView: UIView!
    let menuHelpers = HamburgerMenuHelpers();
    
    @IBAction func openHamburgerMenu(_ sender: Any) {
        menuHelpers.setUpMenuView(view, hamburgerMenuView, leadingConstraint);
    }
    
    @IBAction func nameEnterButton(_ sender: Any) {
        self.updateWelcomeLabel();
    }
    
    func updateWelcomeLabel() -> Void {
        let name = self.nameInputField.text;
        
        if (name != "") {
            self.welcomeLabel.text = "Welcome, " + name! + "!";
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (textField.text != "") {
            self.nameInputField.resignFirstResponder();
            self.updateWelcomeLabel();
            return true;
        }
        return false;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.nameInputField.delegate = self;
        self.hamburgerMenuView.layer.shadowRadius = 6;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }


}

