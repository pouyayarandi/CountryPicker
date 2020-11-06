//
//  UIViewController+KeyboardAwareConstraint.swift
//  CountryPicker
//
//  Created by Pouya Yarandi on 11/6/20.
//  Copyright © 2020 RoundTable. All rights reserved.
//

import UIKit

extension UIViewController {
    func subscribeKeyboardNotification() {
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification, object: nil
        )
        NotificationCenter.default.addObserver(
            self, selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification, object: nil
        )
    }
    
    private var keyboardAwareConstraint: KeyboardAwareConstraint? {
        view.constraints.compactMap({ $0 as? KeyboardAwareConstraint }).first
    }
    
    private func keyboardHeight(from notification: Notification, includesSafeArea: Bool) -> CGFloat? {
        guard let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?
                .cgRectValue.height else { return nil }
        
        var bottomSafeArea: CGFloat
        if #available(iOS 11.0, *) {
            bottomSafeArea = view.safeAreaInsets.bottom
        } else {
            bottomSafeArea = 0
        }
        
        return keyboardHeight - (includesSafeArea ? 0 : bottomSafeArea)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let constraint = keyboardAwareConstraint else { return }
        guard let height = keyboardHeight(from: notification, includesSafeArea: constraint.includeSafeArea) else { return }
        
        constraint.applyKeyboardHeight(height)
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        guard let constraint = keyboardAwareConstraint else { return }
        
        constraint.resetHeight()
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.view.layoutIfNeeded()
        }
    }
    
}
