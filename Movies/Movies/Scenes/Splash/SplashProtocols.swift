//
//  SplashProtocols.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Burak Cokyildirim

import UIKit

// MARK: - View Controller

protocol SplashViewControllerProtocol: BaseViewControllerProtocol {
    
    func showLaunchText(_ text: String?)
    func showHomeScreen()
}

// MARK: - Presenter

protocol SplashPresenterViewProtocol: BasePresenterViewProtocol {
    
    func checkNetworkState()
    func getLaunchText()
}

protocol SplashPresenterInteractorProtocol: BasePresenterInteractorProtocol {
    
    func showNetworkError()
    func showLaunchText(_ text: String?)
}

protocol SplashPresenterDelegateProtocol: BasePresenterDelegateProtocol {
    
}

// MARK: - Interactor

protocol SplashInteractorProtocol: BaseInteractorProtocol {
    
    func checkNetworkState()
    func fetchLaunchText()
}
