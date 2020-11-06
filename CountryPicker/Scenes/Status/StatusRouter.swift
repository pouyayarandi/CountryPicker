//
//  StatusRouter.swift
//  CountryPicker
//
//  Created by Pouya Yarandi on 11/3/20.
//  Copyright (c) 2020 RoundTable. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol StatusRoutingLogic {
    func navigateToPickerView()
}

protocol StatusDataPassing {
    var dataStore: StatusDataStore? { get }
}

class StatusRouter: NSObject, StatusRoutingLogic, StatusDataPassing {
    weak var viewController: StatusViewController?
    var dataStore: StatusDataStore?

    // MARK: Routing
    
    func routeToPickerViewControllerWithSegue(_ segue: UIStoryboardSegue) {
        guard let destination = segue.destination as? PickerViewController,
              var dataStore = destination.router?.dataStore
        else {
            return
        }
        
        passDelegateToPickerView(dataStore: &dataStore)
    }
    
    // MARK: Navigation
    
    func navigateToPickerView() {
        let destination = String(describing: PickerViewController.self)
        viewController?.performSegue(withIdentifier: destination, sender: nil)
    }

    // MARK: Passing data
    
    private func passDelegateToPickerView(dataStore: inout PickerDataStore) {
        dataStore.delegate = viewController?.statusInteractor
    }
}
