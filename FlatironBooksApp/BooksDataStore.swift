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
            let url = book["url"] else {return}
        
        let titleString = title as? String ?? ""
        let authorString = author as? String ?? ""
        let publisherString = publisher as? String ?? ""
        let urlString = url as? String ?? ""
        
        let bookToAdd = Book(title: titleString, author: authorString, publisher: publisherString, url: urlString)
        
        BooksDataStore.shared.books.append(bookToAdd)
    }
    
}
