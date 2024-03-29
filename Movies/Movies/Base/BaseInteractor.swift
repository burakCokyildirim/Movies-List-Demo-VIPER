//
//  BaseInteractor.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Burak Cokyildirim

import Foundation

class BaseInteractor {
    
    // MARK: - Properties
    
    internal var firebaseService: FirebaseService!
    internal var networkService: NetworkService!

    init(networkService: NetworkService?, firebaseService: FirebaseService?) {
        if let networkService = networkService {
            self.networkService = networkService
        }
        if let firebaseService = firebaseService {
            self.firebaseService = firebaseService
        }
    }
    
}

// MARK: - Extensions

// MARK: - Protocols Implemantations

extension BaseInteractor: BaseInteractorProtocol {
    
}
