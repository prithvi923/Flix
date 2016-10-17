//
//  ViewController.swift
//  Flix
//
//  Created by Prithvi Prabahar on 10/15/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController, UITableViewDataSource {
    
    var nowPlayingMovies: NSArray!
    var url = ""
    @IBOutlet weak var moviesTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        url = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(Secrets.apiKey)&language=en-US"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON{ response in
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)   // result of response serialization
            
            if let result = response.result.value {
                let JSON = result as! NSDictionary
                self.nowPlayingMovies = JSON["results"] as! NSArray
                self.moviesTable.reloadData()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if nowPlayingMovies != nil {
            return nowPlayingMovies.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTable.dequeueReusableCell(withIdentifier: "com.flix.movie") as! FXMovieTableViewCell
        let movie = nowPlayingMovies[indexPath.row] as! NSDictionary
        cell.setMovie(movie: movie)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! FXMovieTableViewCell
        let indexPath = moviesTable.indexPath(for: cell)
        let movie = nowPlayingMovies![indexPath!.row] as? NSDictionary
        
        let detailViewController = segue.destination as! FXMovieDetailViewController
        detailViewController.movie = movie
    }
}

