//
//  PickerWorkerTests.swift
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

class CountryRequestWorkerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: CountryRequestWorker!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        setupPickerWorker()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupPickerWorker() {
        sut = CountryRequestWorker()
    }
        
    // MARK: Tests
    
    func testFetchAllCountries() {
        // Given
        let expect = XCTestExpectation(description: "fetchAll")
        let contentProvider: CountriesContentProvider = .all
        
        // When
        sut.fetchCountries(contentProvider).ensure {
            expect.fulfill()
        }
            
        // Then
        .done { countries in
            XCTAssertFalse(countries.isEmpty)
        }
        .catch { error in
            XCTFail(error.asAFError.debugDescription)
        }
    
        wait(for: [expect], timeout: 10)
    }
    
    func testFetchEURegionCountries() {
        // Given
        let expect = XCTestExpectation(description: "fetchEU")
        let contentProvider: CountriesContentProvider = .regionalBloc(.eu)
        
        // When
        sut.fetchCountries(contentProvider).ensure {
            expect.fulfill()
        }
            
        // Then
        .done { countries in
            XCTAssertFalse(countries.isEmpty)
        }
        .catch { error in
            XCTFail(error.asAFError.debugDescription)
        }
    
        wait(for: [expect], timeout: 10)
    }
}
