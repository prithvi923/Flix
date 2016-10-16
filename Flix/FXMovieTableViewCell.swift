//
//  FXMovieTableViewCell.swift
//  Flix
//
//  Created by Prithvi Prabahar on 10/15/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit
import Alamofire

class FXMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setMovie(movie: NSDictionary) {
        movieTitle?.text = movie["title"] as? String
        
        if let posterPath = movie["poster_path"] as? String {
            setImageWithURL(posterPath: posterPath)
        } else {
            // No poster image. Can either set to nil (no image) or a default movie poster image
            // that you include as an asset
            moviePoster.image = nil
        }
    }

    func setImageWithURL(posterPath: String) {
        moviePoster.contentMode = .scaleAspectFit
        Alamofire.request("https://image.tmdb.org/t/p/w342\(posterPath)")
            .responseData { response in
                print(response.result.value)
                if let data = response.result.value {
                    self.moviePoster.image = UIImage(data: data)
                }
        }
    }
}
