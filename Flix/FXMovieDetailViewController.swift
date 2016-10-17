//
//  FXMovieDetailViewController.swift
//  Flix
//
//  Created by Prithvi Prabahar on 10/16/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class FXMovieDetailViewController: UIViewController {

    @IBOutlet weak var moviePosterView: UIImageView!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieTitleLabel.text = movie["title"] as? String
        movieDescriptionLabel.text = movie["overview"] as? String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
