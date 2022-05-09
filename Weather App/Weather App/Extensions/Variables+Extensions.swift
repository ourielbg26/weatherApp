//
//  Variables+Extensions.swift
//  Weather App
//
//  Created by Itzik Bar-Noy on 18/06/2020.
//  Copyright © 2020 Itzik Bar-Noy. All rights reserved.
//

import Foundation

extension Double {
    
    func toString2Digits() -> String {
        return String(format: "%.2f", self)
    }
}
