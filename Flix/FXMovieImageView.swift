//
//  FXMovieImageView.swift
//  Flix
//
//  Created by Prithvi Prabahar on 10/16/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class FXMovieImageView: UIImage {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    init() {
        super.init()
        
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
