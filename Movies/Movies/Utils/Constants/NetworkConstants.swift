//
//  NetworkConstants.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

struct NetworkConstants {
    fileprivate static let baseUrl = "https://www.omdbapi.com"
    struct omdb {
        fileprivate static let urlWithAPIKey = NetworkConstants.baseUrl + "/?apikey=d351284"
        static let search = NetworkConstants.omdb.urlWithAPIKey + "&s="
        static let detail = NetworkConstants.omdb.urlWithAPIKey + "&i="
    }
    static let urlNoImage = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Noimage.svg/739px-Noimage.svg.png"
}
