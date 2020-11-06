//
//  StatusViewControllerTests.swift
//  CountryPicker
//
//  Created by Pouya Yarandi on 11/6/20.
//  Copyright (c) 2020 RoundTable. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import CountryPicker
import XCTest

class StatusViewControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: StatusViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupStatusViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupStatusViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "StatusViewController") as? StatusViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    func testDisplayCountries() {
        // Given
        let countries = [
            Status.Country(name: "Iran"),
            Status.Country(name: "United States")
        ]
        
        // When
        loadView()
        sut.displayCountries(countries: countries)
        
        // Then
        XCTAssertEqual(sut.statusView.countriesTextView.text, "Iran, United States")
    }
    
    func testDisplayEmptyList() {
        // Given
        let countries: [Status.Country] = []
        
        // When
        loadView()
        sut.displayCountries(countries: countries)
        
        // Then
        XCTAssertEqual(sut.statusView.countriesTextView.text, "You have selected no country")
    }
}