//
//  Movie.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 22.11.2020.
//

import Foundation
import SwiftyJSON

class Movie: BaseModel {
    
    var title: String!
    var year: String!
    var imdbID: String!
    var type: String!
    var poster: String!
    
    required init(json: JSON) {
        super.init(json: json)
        
        title = json["Title"].stringValue
        year = json["Year"].stringValue
        imdbID = json["imdbID"].stringValue
        type = json["Type"].stringValue
        poster = json["Poster"].stringValue
    }
}
