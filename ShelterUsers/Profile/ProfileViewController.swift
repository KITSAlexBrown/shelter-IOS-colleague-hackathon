//
//  FirstViewController.swift
//  ShelterUsers
//
//  Created by Alex Brown on 06/03/2018.
//  Copyright © 2018 Kingfisher digital. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var findEvents: UIButton!
    @IBOutlet weak var yourEvents: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Handle Tap
    @IBAction func tapYourEvents(_ sender: Any) {
        performSegue(withIdentifier: "showEvents", sender: self)
    }
    
    /// Handle Tap
    @IBAction func tapFindEvents(_ sender: Any) {
        performSegue(withIdentifier: "findEvents", sender: self)
    }

}

