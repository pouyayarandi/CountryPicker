//
//  PickerWorker.swift
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
import Moya
import PromiseKit

class CountryRequestWorker {
    private var provider = MoyaProvider<CountriesContentProvider>()
    typealias Response = Picker.Country.Response
    
    func fetchCountries(_ content: CountriesContentProvider) -> Promise<[Response]> {
        Promise { seal in
            provider.request(content) { result in
                switch result {
                case .success(let response):
                    seal.fulfill(response.data)
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
        .map {
            try JSONDecoder().decode([Response].self, from: $0)
        }
    }
}
