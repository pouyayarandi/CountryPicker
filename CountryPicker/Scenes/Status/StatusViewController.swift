//
//  StatusViewController.swift
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

protocol StatusDisplayLogic: class {
    func displayCountries(countries: [Status.Something.ViewModel])
}

class StatusViewController: UIViewController, StatusDisplayLogic {
    var interactor: StatusBusinessLogic?
    var router: (NSObjectProtocol & StatusRoutingLogic & StatusDataPassing)?
    
    // swiftlint:disable force_cast
    var statusView: StatusView {
        view as! StatusView
    }
    
    var statusInteractor: StatusInteractor {
        interactor as! StatusInteractor
    }

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = StatusInteractor()
        let presenter = StatusPresenter()
        let router = StatusRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupActionButton()
    }

    // MARK: Do something
    
    @Localizable(key: "Status scene title")
    private var sceneTitle
    
    private func setupNavigationBar() {
        title = sceneTitle
    }
    
    private func setupActionButton() {
        statusView.actionBar.action = { [weak self] in
            self?.router?.navigateToPickerView()
        }
    }

    func displayCountries(countries: [Status.Something.ViewModel]) {
        //
    }
}
