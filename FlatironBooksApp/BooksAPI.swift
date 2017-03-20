//
//  BooksAPI.swift
//  FlatironBooksApp
//
//  Created by Michael on 3/15/17.
//  Copyright © 2017 Michael. All rights reserved.
//

import Foundation

class BooksAPI {
    
    class func getBooks(_ completion: @escaping () -> ()) {
        
        let urlString = "https://flatironchallenge.herokuapp.com/books"
        guard let url = URL(string: urlString) else {fatalError("Invaild URL")}
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard let responseData = data else {fatalError("Data Error")}
            do {
                guard let responseJSON = try JSONSerialization.jsonObject(with: responseData, options: []) as? [[String:Any]] else {fatalError("Error")}
                let results = responseJSON as? [[String:Any]]
                results?.forEach({ (booksDict) in
                    BooksDataStore.addBookToArray(booksDict)
                })
            } catch {
            }
            completion()
        }
        dataTask.resume()
    }
    
    
    class func addBook(book: [String:Any], completion: @escaping () -> ()) {
        let urlString = "https://flatironchallenge.herokuapp.com/books"
        guard let url = URL(string: urlString) else {fatalError("Invaild URL")}
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        guard let json = try? JSONSerialization.data(withJSONObject: book, options: []) else { return }
            request.httpBody = json
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler:  { (data, response, error) in
                guard (response as? HTTPURLResponse) != nil else {fatalError("Invalid response")}
                completion()
            })
            task.resume()
        
    }
        
    
}
