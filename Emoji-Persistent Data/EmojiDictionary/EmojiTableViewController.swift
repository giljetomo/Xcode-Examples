//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Derrick Park on 2021-01-06.
//

import UIKit

class EmojiTableViewController: UITableViewController, AddEditEmojiTVCDelegate {
  let cellId = "EmojiCell"
  
  var emojis: [Emoji] = [] {
    didSet {
      Emoji.saveToFile(emojis: emojis)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    tableView.register(EmojiTableViewCell.self, forCellReuseIdentifier: cellId)
    title = "Emoji Dictionary"
    
    // edit button
    navigationItem.leftBarButtonItem = editButtonItem
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewEmoji))
    
    // dynamic row height
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 44.0
    
    if let savedEmojis = Emoji.loadFromFile() {
      emojis = savedEmojis
    } else {
      emojis = Emoji.sampleEmojis
    }
    // path 
    let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    print("Document Path: ", documentsPath)
  }
  
  private func navigateToAddEditTVC() {
    let addEditTVC = AddEditEmojiTableViewController(style: .grouped)
    addEditTVC.delegate = self
    let addEditNC = UINavigationController(rootViewController: addEditTVC)
    present(addEditNC, animated: true, completion: nil)
  }
  
  @objc func addNewEmoji() {
    // present modally (AddEditEmojiTableViewController)
    navigateToAddEditTVC()
  }
  
  func add(_ emoji: Emoji) {
    emojis.append(emoji)
    tableView.insertRows(at: [IndexPath(row: emojis.count - 1, section: 0)], with: .automatic)
  }
  
  func edit(_ emoji: Emoji) {
    if let indexPath = tableView.indexPathForSelectedRow {
      emojis.remove(at: indexPath.row)
      emojis.insert(emoji, at: indexPath.row)
      tableView.reloadRows(at: [indexPath], with: .automatic)
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return emojis.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let emoji = emojis[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EmojiTableViewCell
    
    cell.update(with: emoji)
    cell.showsReorderControl = true
    return cell
  }
  
  override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    // update model
    let removedEmoji = emojis.remove(at: sourceIndexPath.row)
    emojis.insert(removedEmoji, at: destinationIndexPath.row)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //tableView.deselectRow(at: indexPath, animated: true)
    
    let addEditTVC = AddEditEmojiTableViewController(style: .grouped)
    addEditTVC.delegate = self
    addEditTVC.emoji = emojis[indexPath.row]
    let addEditNC = UINavigationController(rootViewController: addEditTVC)
    present(addEditNC, animated: true, completion: nil)
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      emojis.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .automatic)
    } else if editingStyle == .insert {
      // insert + button is tapped
    }
  }
  
  override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return .delete
  }
}
