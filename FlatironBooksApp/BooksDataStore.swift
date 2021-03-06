//
//  BooksDataStore.swift
//  FlatironBooksApp
//
//  Created by Michael on 3/15/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation

class BooksDataStore {
    
    static let shared = BooksDataStore()
    
    var books: [Book] = []
    
    fileprivate init() {}
    
    class func addBookToArray(_ book: [String:Any]) {
        guard let title = book["title"],
            let author = book["author"],
            let publisher = book["publisher"],
            let url = book["url"],
            let checkOut = book["lastcheckedoutby"] else {return}
        
        let titleString = title as? String ?? ""
        let authorString = author as? String ?? ""
        let publisherString = publisher as? String ?? ""
        let urlString = url as? String ?? ""
        let checkoutString = checkOut as? String ?? "Book has not been checked out"
        
        let bookToAdd = Book(title: titleString, author: authorString, publisher: publisherString, url: urlString, lastCheckedout: checkoutString)
        
        BooksDataStore.shared.books.append(bookToAdd)
    }
    
}
