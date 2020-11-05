//
//  ActionBarView.swift
//  CountryPicker
//
//  Created by Pouya Yarandi on 11/4/20.
//  Copyright © 2020 RoundTable. All rights reserved.
//

import UIKit

@IBDesignable
class ActionBarView: UIView {
    
    var actionButton = UIButton()
    
    // MARK: View Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        actionButton.backgroundColor = buttonColor
        actionButton.setTitle(buttonTitle, for: .normal)
        actionButton.setTitleColor(titleColor, for: .normal)
    }
    
    // MARK: Properties
    
    @IBInspectable
    var buttonColor: UIColor = Color.primaryBlue {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable
    var titleColor: UIColor = Color.onColor {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable
    var buttonTitle: String? {
        didSet {
            layoutSubviews()
        }
    }
    
    var action: (() -> Void)?
    
    // MARK: Setup
    
    private func setup() {
        addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        actionButton.layer.cornerRadius = 10
        actionButton.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            actionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    @objc func buttonDidTap(_ sender: UIButton) {
        action?()
    }

}
