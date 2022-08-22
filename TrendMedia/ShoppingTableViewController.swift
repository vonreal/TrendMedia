//
//  ShoppingTableViewController.swift
//  TrendMedia
//
//  Created by 나지운 on 2022/07/19.
//

import UIKit

import RealmSwift

class ShoppingTableViewController: UITableViewController {

    @IBOutlet weak var userInputTextField: UITextField!
    
    let localRealm = try! Realm()
    var tasks: Results<UserShoppingList>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Realm is located at:", localRealm.configuration.fileURL!)
        tasks = localRealm.objects(UserShoppingList.self).sorted(byKeyPath: "objectId", ascending: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        cell.userContentLabel.text = tasks[indexPath.row].todo
        if tasks[indexPath.row].done {
            cell.checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else if !tasks[indexPath.row].done {
            cell.checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        if tasks[indexPath.row].bookMark {
            cell.bookmarkButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else if !tasks[indexPath.row].bookMark {
            cell.bookmarkButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        cell.bookmarkButton.tag = indexPath.row
        cell.checkButton.tag = indexPath.row
        return cell
    }
    
    @IBAction func inputTextFieldReturn(_ sender: UITextField) {
        saveShoppingList()
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        saveShoppingList()
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let taskToUpdate = tasks[sender.tag]
        try! localRealm.write {
            taskToUpdate.done = !taskToUpdate.done
        }
        tableView.reloadData()
    }
    
    @IBAction func starButtonClicked(_ sender: UIButton) {
        let taskToUpdate = tasks[sender.tag]
        try! localRealm.write {
            taskToUpdate.bookMark = !taskToUpdate.bookMark
        }
        tableView.reloadData()
    }
    

    
    func saveShoppingList() {
        if let text = userInputTextField.text, !text.isEmpty{
            let task = UserShoppingList(todo: text, bookmark: false, done: false)
            try! localRealm.write {
                localRealm.add(task)
                print("Saved Success")
            }
        }
        userInputTextField.text = nil
        view.endEditing(true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let taskToDelete = tasks[indexPath.row]
            try! localRealm.write {
                localRealm.delete(taskToDelete)
                print("Delete Success")
            }
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74.5
    }
}
