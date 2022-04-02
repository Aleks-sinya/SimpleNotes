//
//  NotesListTableViewController.swift
//  SimpleNotes
//
//  Created by Алексей Синяговский on 02.04.2022.
//

import UIKit

class NotesListTableViewController: UITableViewController {
       
    //MARK: - Public Properties
    var note: Note!
    
    //MARK: - Private Properties
    private var notes = Note.returnExampleNotes()
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem?.image = UIImage(systemName: "line.3.horizontal")
    }
    
    override func viewDidLayoutSubviews() {
        view.addVerticalGradientLayer()
    }
    
    //MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let note = notes[indexPath.row]
        content.text = note.title
        content.secondaryText = note.description
        cell.contentConfiguration = content
        return cell
    }
    
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToChangeSelectedNote", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    //MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToChangeSelectedNote" {
            guard let navigationVC = segue.destination as? UINavigationController else { return }
            guard let notesDetailsVC = navigationVC.topViewController as? NotesDetailsTableViewController else { return }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            notesDetailsVC.note = notes[indexPath.row]
        }
    }
    
    //MARK: - IB Actions
    @IBAction func editBarButtonPressed(sender: UIBarButtonItem) {
        let tableIsEditing = tableView.isEditing
        tableView.setEditing(!tableIsEditing, animated: true)
    }
    
    @IBAction func unwindFor(segue: UIStoryboardSegue) {
        if segue.identifier == "SaveUnwind" {
            guard let source = segue.source as? NotesDetailsTableViewController,
                  let note = source.note else { return }
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    notes[selectedIndexPath.row] = note
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                notes.append(note)
                tableView.reloadData()
            }
        }
    }
}

// MARK: - Set gradient background color
extension UIView {
    func addVerticalGradientLayer() {
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
