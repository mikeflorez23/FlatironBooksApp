//
//  BookDetailViewController.swift
//  FlatironBooksApp
//
//  Created by Michael on 3/15/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var checkoutLabel: UILabel!
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let bookTitle = book?.title,
            let author = book?.author,
            let publisher = book?.publisher,
            let checkedOut = book?.lastCheckedout {
            titleLabel.text = bookTitle
            authorLabel.text = "By: \(author)"
            publisherLabel.text = "Publisher: \(publisher)"
            checkoutLabel.text = checkedOut
        }
    }
    
    @IBAction func checkoutButtonTapped(_ sender: Any) {
        //todo 
    }
    
    
}
