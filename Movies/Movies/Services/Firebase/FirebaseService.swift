//
//  FirebaseService.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 21.11.2020.
//

import Foundation
import FirebaseRemoteConfig
import FirebaseAnalytics

class FirebaseService {
    static let sharedInstance = FirebaseService()
    
    let remoteConfig = RemoteConfig.remoteConfig()
    
    init() {
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
    }
    
    func fetchRemoteConfigValue(key: String, success: @escaping (RemoteConfigValue)->Void, failure: @escaping FailureCompletionHandler) {
        self.remoteConfig.fetch { (_, error) in
            
            if let error = error {
                let errorModel = ErrorModel(errorMessage: error.localizedDescription, errorType: .unknown)
                failure(errorModel)
            }
            
            self.remoteConfig.activate(completionHandler: nil)
            
            let result = self.remoteConfig.configValue(forKey: key)
            success(result)
        }
    }
    
    func logEvent(name: String, parameters: [String: Any]?) {
        Analytics.logEvent(name, parameters: parameters)
    }
}
