//
//  KeyboardAwareConstraint.swift
//  CountryPicker
//
//  Created by Pouya Yarandi on 11/6/20.
//  Copyright © 2020 RoundTable. All rights reserved.
//

import UIKit

@IBDesignable
class KeyboardAwareConstraint: NSLayoutConstraint {
    private var absoluteConstant: CGFloat?
    
    @IBInspectable var includeSafeArea: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        absoluteConstant = constant
    }
    
    func applyKeyboardHeight(_ height: CGFloat) {
        guard let constant = absoluteConstant else { return }
        self.constant = constant + height
    }
    
    func resetHeight() {
        guard let constant = absoluteConstant else { return }
        self.constant = constant
    }
}
