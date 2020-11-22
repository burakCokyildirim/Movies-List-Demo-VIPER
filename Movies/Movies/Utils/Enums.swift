//
//  Enums.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 21.11.2020.
//

import Foundation

enum PopupCloseType {
    case close
    case done
    case yes
    case no
}

enum MessageType: String {
    case typeSomething = "text.type_something"
    case noResult = "text.no_found"
    case keepTyping = "text.keep_typing"
    case done = ""
}
