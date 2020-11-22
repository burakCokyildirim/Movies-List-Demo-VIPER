//
//  MovieRating.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 22.11.2020.
//

import Foundation
import SwiftyJSON

class MovieRating: BaseModel {
    
    var source: String!
    var value: String!
    
    required init(json: JSON) {
        super.init(json: json)
        
        self.source = json["Source"].stringValue
        self.value = json["Value"].stringValue
    }
}
