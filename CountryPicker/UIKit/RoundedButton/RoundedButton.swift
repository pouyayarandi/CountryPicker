//
//  RoundedButton.swift
//  CountryPicker
//
//  Created by Pouya Yarandi on 11/5/20.
//  Copyright © 2020 RoundTable. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let padding = min(frame.height, frame.width) / 2
        
        layer.cornerRadius = padding
        contentEdgeInsets.left = padding
        contentEdgeInsets.right = padding
    }

}
