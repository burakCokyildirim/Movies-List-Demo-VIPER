//
//  MovieDetail.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 22.11.2020.
//

import Foundation
import SwiftyJSON

class MovieDetail: BaseModel {
    
    var title: String!
    var year: String!
    var rated: String!
    var released: String!
    var runtime: String!
    var genre: String!
    var director: String!
    var writer: String!
    var actors: String!
    var plot: String!
    var language: String!
    var country: String!
    var awards: String!
    var poster: String!
    var ratings: [MovieRating] = []
    var metascore: String!
    var imdbRating: String!
    var imdbVotes: String!
    var imdbID: String!
    var type: String!
    var DVD: String!
    var boxOffice: String!
    var production: String!
    var website: String!
    
    
    required init(json : JSON) {
        super.init(json: json)
        
        self.title = json["Title"].stringValue
        self.year = json["Year"].stringValue
        self.rated = json["Rated"].stringValue
        self.released = json["Released"].stringValue
        self.runtime = json["Runtime"].stringValue
        self.genre = json["Genre"].stringValue
        self.director = json["Director"].stringValue
        self.writer = json["Writer"].stringValue
        self.actors = json["Actors"].stringValue
        self.plot = json["Plot"].stringValue
        self.language = json["Language"].stringValue
        self.country = json["Country"].stringValue
        self.awards = json["Awards"].stringValue
        self.poster = json["Poster"].stringValue
        
        for r in json["Ratings"].arrayValue {
            self.ratings.append(MovieRating(json: r))
        }
        
        self.metascore = json["Metascore"].stringValue
        self.imdbRating = json["imdbRating"].stringValue
        self.imdbVotes = json["imdbVotes"].stringValue
        self.imdbID = json["imdbID"].stringValue
        self.type = json["Type"].stringValue
        self.DVD = json["DVD"].stringValue
        self.boxOffice = json["boxOffice"].stringValue
        self.production = json["Production"].stringValue
        self.website = json["Website"].stringValue
    }
}
