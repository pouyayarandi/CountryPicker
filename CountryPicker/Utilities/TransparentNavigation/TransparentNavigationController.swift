//
//  TransparentNavigationController.swift
//  CountryPicker
//
//  Created by Pouya Yarandi on 11/5/20.
//  Copyright © 2020 RoundTable. All rights reserved.
//

import UIKit

class TransparentNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }
}
