//
//  DevelopersViewController.swift
//  SimpleNotes
//
//  Created by Алексей Синяговский on 02.04.2022.
//

import UIKit

class DevelopersViewController: UITableViewController {
    
    let developersList = Developer.getDeveloperList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        tableView.rowHeight = 120
    }

    
    }
