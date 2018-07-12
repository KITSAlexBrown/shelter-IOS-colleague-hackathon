//
//  QuestionViewController.swift
//  ShelterUsers
//
//  Created by Alex Brown on 07/03/2018.
//  Copyright © 2018 Kingfisher digital. All rights reserved.
//


import Foundation
import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// Handle Tap
    @IBAction func tapGuest(_ sender: Any) {
        performSegue(withIdentifier: "showTabs", sender: self)
    }
    
    /// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
