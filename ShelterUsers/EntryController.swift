//
//  EntryController.swift
//  ShelterUsers
//
//  Created by Alex Brown on 06/03/2018.
//  Copyright © 2018 Kingfisher digital. All rights reserved.
//

import Foundation
import UIKit

class EntryController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var guestButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /// Handle Tap
    @IBAction func tapGuest(_ sender: Any) {
        performSegue(withIdentifier: "showGuest", sender: self)
    }
    
    /// Handle Tap
    @IBAction func tapAuth(_ sender: Any) {
        performSegue(withIdentifier: "showAuth", sender: self)
    }
    
    /// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
