//
//  NotesDetailsTableViewController.swift
//  SimpleNotes
//
//  Created by Алексей Синяговский on 02.04.2022.
//

import UIKit

class NotesDetailsTableViewController: UITableViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var notesNameTextField: UITextField!
    @IBOutlet var notesDescriptionTextView: UITextView!
    
    //MARK: - Public Properties
    var note: Note!
    
    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        notesNameTextField.layer.cornerRadius = 12
        notesDescriptionTextView.layer.cornerRadius = 12
        setupUI()
        updateSaveButtonState()
    }
    
    override func viewDidLayoutSubviews() {
        view.addVerticalGradientLayerNotesDetailVC()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SaveUnwind" else { return }
        guard let notesTitle = notesNameTextField.text,
              let notesDescription = notesDescriptionTextView.text else { return }
        note = Note(title: notesTitle, description: notesDescription)
    }
    
    //MARK: - IB Actions
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func notesTitleIsChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    //MARK: - Private Methods
    private func setupUI() {
        notesNameTextField.text = note?.title ?? ""
        notesDescriptionTextView.text = note?.description ?? ""
    }
    
    private func updateSaveButtonState() {
        guard let notesName = notesNameTextField.text,
              !notesName.isEmpty && notesName.count >= 1 else {
            navigationItem.rightBarButtonItem?.isEnabled = false
            return
        }
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
}

// MARK: - Set gradient background color
extension UIView {
    func addVerticalGradientLayerNotesDetailVC() {
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
