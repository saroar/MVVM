//
//  ViewModel.swift
//  MVVM
//
//  Created by Alif on 25/10/2017.
//  Copyright © 2017 Alif. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    @IBOutlet var moviesClient: MoviesClient!
    var movies: [NSDictionary]?
    
    func fetchMovies(completion: @escaping () -> ()) {
        moviesClient.fetchMovies { movies in
            self.movies = movies
            completion()
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func titleForRowAtIndexPath(indexPath: IndexPath) -> String {
        return (movies?[indexPath.row].value(forKeyPath: "im:name.label") as? String) ?? ""
    }
}
