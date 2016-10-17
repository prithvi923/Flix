//
//  FXImageViewExtension.swift
//  Flix
//
//  Created by Prithvi Prabahar on 10/16/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit
import Alamofire

extension UIImageView {
    func setImageWithURL(posterPath: String) {
        Alamofire.request("https://image.tmdb.org/t/p/w342\(posterPath)")
            .responseData { response in
                if let data = response.result.value {
                    self.image = UIImage(data: data)
                } else {
                    self.image = nil
                }
                self.contentMode = .scaleAspectFit
        }
    }
}
