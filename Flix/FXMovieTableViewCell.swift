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
    @IBOutlet weak var movieDescription: UILabel!

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
        movieDescription.text = movie["overview"] as? String
        
        if let posterPath = movie["poster_path"] as? String {
            moviePoster.setImageWithURL(posterPath: posterPath)
        }
    }
}
