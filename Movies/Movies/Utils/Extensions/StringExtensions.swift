//
//  StringExtensions.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func localized(comment: String) -> String {
        return NSLocalizedString(self, comment: comment)
    }

    var storyboardLocalized: String {
        return NSLocalizedString(self, tableName: "StoryboardLocalizable", bundle: Bundle.main, value: "", comment: "")
    }
    
    func containsOnlyCharactersIn(matchCharacters: String) -> Bool {
        let disallowedCharacterSet = NSCharacterSet(charactersIn: matchCharacters).inverted
        return self.rangeOfCharacter(from: disallowedCharacterSet, options: String.CompareOptions.caseInsensitive) == nil
    }
    
    func format(_ args: [CVarArg]) -> String {
        return String.init(format: self, arguments: args)
    }
    
    var turkishUppercased: String {
        return self.uppercased(with: Locale(identifier: "tr_TR"))
    }
    
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
