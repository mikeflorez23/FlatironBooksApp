//
//  BookListViewController.swift
//  FlatironBooksApp
//
//  Created by Michael on 3/15/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let store = BooksDataStore.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        BooksAPI.getBooks {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "booksCell", for: indexPath) as! BooksTableViewCell
        let bookValue = store.books[indexPath.row]
        cell.titleLabel.text = bookValue.title
        cell.authorLabel.text = bookValue.author
        return cell
    }
    
    
    // MARK: - TableViewDelegate
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            store.books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBookDetailVC" {
            if let dest = segue.destination as? BookDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                let selectedBook = BooksDataStore.shared.books[indexPath.row]
                dest.book = selectedBook
            }
        }
    }
}
