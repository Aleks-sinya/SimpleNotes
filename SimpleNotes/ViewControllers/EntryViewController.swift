//
//  EntryViewController.swift
//  SimpleNotes
//
//  Created by Алексей Синяговский on 02.04.2022.
//

import UIKit

class EntryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func developersButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let developerVC = storyboard.instantiateViewController(identifier: "DevelopersVC") as? DevelopersViewController {
            show(developerVC, sender: nil)
        }
    }
    
    @IBAction func unwindFor(segue: UIStoryboardSegue) {
    }
}
