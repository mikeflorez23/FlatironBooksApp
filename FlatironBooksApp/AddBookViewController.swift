//
//  AddBookViewController.swift
//  FlatironBooksApp
//
//  Created by Michael on 3/15/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var publisherTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Unsaved Changes", message: "Changes you have made will not be saved.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Fields Empty", message: "All Fields Are Required", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
        }
        alert.addAction(okAction)
        if !titleTextField.hasText || !authorTextField.hasText || !publisherTextField.hasText || !urlTextField.hasText {
            self.present(alert, animated: true)
        } else {
            
            guard let title = titleTextField.text else {return}
            guard let author = authorTextField.text else {return}
            guard let publisher = publisherTextField.text else {return}
            guard let url = urlTextField.text else {return}
            
            let newBook: [String:Any] = ["title": title,
                                         "author": author,
                                         "publisher": publisher,
                                         "url": url]
            BooksAPI.addBook(book: newBook, completion: { 
                
            })
            
            dismiss(animated: true, completion: nil)
        }
    }

    
    
}
