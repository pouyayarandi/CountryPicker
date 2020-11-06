//
//  PickerViewController.swift
//  CountryPicker
//
//  Created by Pouya Yarandi on 11/5/20.
//  Copyright (c) 2020 RoundTable. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PickerDisplayLogic: class {
    func updateCountriesTable(with countries: [Picker.Country.ViewModel])
}

class PickerViewController: UIViewController, PickerDisplayLogic {
    var interactor: PickerBusinessLogic?
    var router: (NSObjectProtocol & PickerRoutingLogic & PickerDataPassing)?
    
    typealias Cell = CountriesTableViewCell
    
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
        let interactor = PickerInteractor()
        let presenter = PickerPresenter()
        let router = PickerRouter()
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
        
        setupView()
        setupNavigationBar()
        setupCountriesTableView()
        setupActionBar()
    }
    
    // MARK: Do something
    
    @IBOutlet private var countriesTableView: UITableView!
    @IBOutlet private var actionBar: ActionBarView!
    
    private struct Constants {
        @Localizable(key: "Picker action button title")
        static var buttonTitle
        
        @Localizable(key: "Picker scene title")
        static var sceneTitle
    }
    
    private var countries: [Picker.Country.ViewModel] = [] {
        didSet {
            guard countriesTableView != nil else { return }
            countriesTableView.reloadData()
        }
    }
    
    private func setupView() {
        view.backgroundColor = Color.defaultBG
    }
    
    private func setupNavigationBar() {
        title = Constants.sceneTitle
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    private func setupCountriesTableView() {
        countriesTableView.dataSource = self
    }
    
    private func setupActionBar() {
        actionBar.buttonTitle = Constants.buttonTitle
        actionBar.action = { [weak self] in
            self?.router?.dismiss()
        }
    }
    
    func updateCountriesTable(with countries: [Picker.Country.ViewModel]) {
        self.countries = countries
    }
    
    private func addButtonDidTap(forIndexPath indexPath: IndexPath) {
        
    }
}

extension PickerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: Cell.self)) as! Cell
        let country = countries[indexPath.row]
        
        cell.name = country.name
        cell.isAdded = country.isAdded
        cell.addButtonCallback = { [weak self] in
            self?.addButtonDidTap(forIndexPath: indexPath)
        }
        
        return cell
    }
}
