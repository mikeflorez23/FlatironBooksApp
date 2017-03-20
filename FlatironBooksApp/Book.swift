//
//  Book.swift
//  FlatironBooksApp
//
//  Created by Michael on 3/15/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation

class Book {
    
    let title: String
    let author: String
    let publisher: String
    let url: String
    let lastCheckedout: String?
    
    init(title: String, author: String, publisher: String, url: String, lastCheckedout: String) {
        self.title = title
        self.author = author
        self.publisher = publisher
        self.url = url
        self.lastCheckedout = lastCheckedout
    }
    
}
