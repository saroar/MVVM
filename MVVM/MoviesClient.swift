//
//  MoviesClient.swift
//  MVVM
//
//  Created by Alif on 25/10/2017.
//  Copyright © 2017 Alif. All rights reserved.
//

import UIKit

class MoviesClient: NSObject {
    
    func fetchMovies(completion: @escaping ([NSDictionary]?) -> ()) {
        // fetch the data
        let urlString = "https://itunes.apple.com/us/rss/topmovies/limit=13/json"
        let url = URL(string: urlString)
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url!, completionHandler: {(data, response, error) -> Void in
            if error != nil {
                completion(nil)
            }
            
            // check response status code..

            if let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                if let movies = json?.value(forKeyPath: "feed.entry") as? [NSDictionary] {
                    completion(movies)
                    return
                }
            }
        })
        
        task.resume()
        
    }
}
