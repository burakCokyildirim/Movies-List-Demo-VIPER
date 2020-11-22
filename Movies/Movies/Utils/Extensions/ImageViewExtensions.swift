//
//  ImageViewExtensions.swift
//  Movies
//
//  Created by Burak Çokyıldırım on 21.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(url: String, completionHandler: @escaping ((Result<RetrieveImageResult, KingfisherError>) -> Void)) {
        
        kf.setImage(with: URL(string: url), placeholder: nil, options: nil, progressBlock: nil) { (result) in
            switch result {
            case .success(_):
                completionHandler(result)
            case .failure(_):
                self.kf.setImage(with: URL(string: NetworkConstants.urlNoImage), placeholder: nil, options: nil, progressBlock: nil, completionHandler: completionHandler)
            }
        }
    }
    
    func makeRounded() {

        self.layer.borderWidth = 0.5
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
