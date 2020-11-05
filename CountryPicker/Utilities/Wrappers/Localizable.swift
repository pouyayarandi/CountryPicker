//
//  Localizable.swift
//  CountryPicker
//
//  Created by Pouya Yarandi on 11/5/20.
//  Copyright © 2020 RoundTable. All rights reserved.
//

import Foundation

@propertyWrapper
struct Localizable {
    var key: String = ""
    
    var wrappedValue: String {
        get {
            NSLocalizedString(key, comment: "")
        }
        set {
            key = newValue
        }
    }
}
