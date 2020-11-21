//
//  TypeAlias.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 21.11.2020.
//

import Foundation
import SwiftyJSON

typealias PopupCompletionHandler = (_ closeType: PopupCloseType) -> Void
typealias SuccessCompletionHandler = (_ result: JSON) -> Void
typealias FailureCompletionHandler = (ErrorModel) -> Void
