//
//  UIActivityIndicatorView+Extensions.swift
//  Weather App
//
//  Created by Itzik Bar-Noy on 11/06/2020.
//  Copyright © 2020 Itzik Bar-Noy. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
    
    func setup(view: UIView) {
        self.center = view.center
        self.style = .large
        self.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.hidesWhenStopped = true
        self.startAnimating()
        view.addSubview(self)
    }
}
