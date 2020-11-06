//
//  StatusView.swift
//  CountryPicker
//
//  Created by Pouya Yarandi on 11/5/20.
//  Copyright © 2020 RoundTable. All rights reserved.
//

import UIKit

class StatusView: UIView {
    
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var countriesTextView: UITextView!
    @IBOutlet var countriesTextViewContainer: UIView!
    @IBOutlet var actionBar: ActionBarView!
    
    private struct Constants {
        @Localizable(key: "Selected country list description")
        static var descriptionText
        
        @Localizable(key: "Select country button title")
        static var actionButtonTitle
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    private func setup() {
        backgroundColor = Color.defaultBG
        
        setupDescriptionLabel()
        setupCountriesTextView()
        setupActionBar()
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.text = Constants.descriptionText
        descriptionLabel.textColor = Color.secondaryText
    }
    
    private func setupCountriesTextView() {
        // todo: make constant for these values
        countriesTextView.textContainerInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        countriesTextViewContainer.layer.cornerRadius = 8
        countriesTextViewContainer.layer.borderColor = Color.primaryBlue.cgColor
        countriesTextViewContainer.layer.borderWidth = 2
        
        countriesTextViewContainer.layer.shadowOffset = .zero
        countriesTextViewContainer.layer.shadowColor = UIColor.black.cgColor
        countriesTextViewContainer.layer.shadowRadius = 12
        countriesTextViewContainer.layer.shadowOpacity = 0.2
        countriesTextViewContainer.clipsToBounds = false
    }
    
    private func setupActionBar() {
        actionBar.buttonTitle = Constants.actionButtonTitle
    }
}
