//
//  MovieRatings.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 22.11.2020.
//

import Foundation
import SwiftyJSON

class MovieRating: BaseModel {
    
    required init(json: JSON) {
        super.init(json: json)
        
        
    }
}
