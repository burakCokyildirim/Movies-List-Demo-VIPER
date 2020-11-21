//
//  NSObjectExtension.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

extension NSObject {

    class var className: String {
        return String(describing: self)
    }
}
