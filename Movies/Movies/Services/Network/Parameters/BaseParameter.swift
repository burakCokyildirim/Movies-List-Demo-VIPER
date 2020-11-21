//
//  BaseParameter.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class BaseParameter {
    
    init() {}
    
    func toDictionary() -> [String: Any]? {
       return nil
    }
    
    static func toDictionaries<P: BaseParameter>(parameters: [P]) -> [[String: Any]?] {
        return parameters.map({ $0.toDictionary() })
    }
    
}
