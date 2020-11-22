//
//  Detail.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 22.11.2020.
//

import Foundation
import SwiftyJSON

class MovieDetail: BaseModel {
    
//    [{
//    "Title": "Rush",
//    "Year": "2013",
//    "Rated": "R",
//    "Released": "27 Sep 2013",
//    "Runtime": "123 min",
//    "Genre": "Action, Biography, Drama, Sport",
//    "Director": "Ron Howard",
//    "Writer": "Peter Morgan",
//    "Actors": "Chris Hemsworth, Daniel Brühl, Olivia Wilde, Alexandra Maria Lara",
//    "Plot": "The merciless 1970s rivalry between Formula One rivals James Hunt and Niki Lauda.",
//    "Language": "English, German, Italian, French, Spanish",
//    "Country": "UK, Germany, USA",
//    "Awards": "Nominated for 2 Golden Globes. Another 6 wins & 63 nominations.",
//    "Poster": "https://m.media-amazon.com/images/M/MV5BOWEwODJmZDItYTNmZC00OGM4LThlNDktOTQzZjIzMGQxODA4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg",
//    "Ratings": [
//        {
//            "Source": "Internet Movie Database",
//            "Value": "8.1/10"
//        },
//        {
//            "Source": "Rotten Tomatoes",
//            "Value": "88%"
//        },
//        {
//            "Source": "Metacritic",
//            "Value": "74/100"
//        }
//    ],
//    "Metascore": "74",
//    "imdbRating": "8.1",
//    "imdbVotes": "426,912",
//    "imdbID": "tt1979320",
//    "Type": "movie",
//    "DVD": "N/A",
//    "BoxOffice": "N/A",
//    "Production": "Revolution, Imagine Entertainment, Working Title Films",
//    "Website": "N/A",
//    "Response": "True"
//}]
    
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
    var ratings: String!
    
    required init(json : JSON) {
        super.init(json: json)
        
        
    }
}
