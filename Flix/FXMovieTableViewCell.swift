//
//  FXMovieTableViewCell.swift
//  Flix
//
//  Created by Prithvi Prabahar on 10/15/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class FXMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
