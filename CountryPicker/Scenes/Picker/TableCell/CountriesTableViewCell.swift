//
//  CountriesTableViewCell.swift
//  CountryPicker
//
//  Created by Pouya Yarandi on 11/5/20.
//  Copyright © 2020 RoundTable. All rights reserved.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addButton: UIButton!
    
    var addButtonCallback: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }

    var name: String? {
        didSet {
            layoutSubviews()
        }
    }
    
    var isAdded: Bool = false {
        didSet {
            layoutSubviews()
        }
    }
    
    private struct Constant {
        @Localizable(key: "Selected country action button title")
        static var selectedText
        
        @Localizable(key: "Unselected country action button title")
        static var unselectedText
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        nameLabel.text = name
        
        addButton.backgroundColor = isAdded ? Color.gray : Color.primaryBlue
        addButton.setTitle(isAdded ? Constant.selectedText : Constant.unselectedText, for: .normal)
    }
    
    @IBAction private func addButtonDidTap() {
        addButtonCallback?()
    }

}
