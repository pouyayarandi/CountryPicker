//
//  CountryContentProvider.swift
//  CountryPicker
//
//  Created by Pouya Yarandi on 11/6/20.
//  Copyright © 2020 RoundTable. All rights reserved.
//

import Foundation
import Moya

enum Region: String {
    // swiftlint:disable identifier_name
    case eu
}

enum CountriesContentProvider {
    case all
    case regionalBloc(_ region: Region)
}

extension CountriesContentProvider: TargetType {
    var baseURL: URL {
        URL(string: "https://restcountries.eu/rest/v2")!
    }
    
    var path: String {
        switch self {
        case .all:
            return "/all"
        case .regionalBloc(let region):
            return "/regionalbloc/\(region.rawValue)"
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var sampleData: Data {
        "{[]}".data(using: .utf8)!
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String: String]? {
        nil
    }
}
