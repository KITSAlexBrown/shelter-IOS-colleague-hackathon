//
//  VolunteerViewController.swift
//  ShelterUsers
//
//  Created by Alex Brown on 07/03/2018.
//  Copyright © 2018 Kingfisher digital. All rights reserved.
//

import Foundation
import UIKit

///
class VolunteerViewController: UIViewController {
    
    @IBOutlet weak var tableItem: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableItem?.delegate = self
        tableItem?.dataSource = self
        tableItem?.rowHeight = 80
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

///
extension VolunteerViewController: UITableViewDelegate, UITableViewDataSource {
 
    ///
    func numberOfSections(in tableView: UITableView) -> Int {
        print("=================================")
        print("=================================")
        print("=================================")
        print("=================================")

        print("Sections")
        return 1
    }
    
    ///
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("=================================")
        print("=================================")
        print("=================================")
        print("=================================")
        print("THE SECTIONS")
        return 10
    }
    
    ///
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VolunteerCell", for: indexPath) as! VolunteerViewCell // swiftlint:disable:this force_cast we know the cell is a
        return cell
    }
    
    
}
