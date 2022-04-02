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

    override func viewDidLayoutSubviews() {
        view.addVerticalGradientLayerDevelopersVC()
    }
        
        //MARK: - Life Cycles Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        developersList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellWithAuthors", for: indexPath)
        let developer = developersList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = developer.nickName
        content.secondaryText = developer.realName
        content.image = UIImage(named: developer.nickName)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        return cell
        }
    }

    // MARK: - Set gradient background color
extension UIView {
    func addVerticalGradientLayerDevelopersVC() {
        let primaryColor = UIColor(
            red: 255/255,
            green: 255/255,
            blue: 255/255,
            alpha: 1
        )
        
        let secondaryColor = UIColor(
            red: 210/255,
            green: 109/255,
            blue: 0/255,
            alpha: 1
        )
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [primaryColor.cgColor, secondaryColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
