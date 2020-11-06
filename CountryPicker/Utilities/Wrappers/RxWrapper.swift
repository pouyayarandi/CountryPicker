//
//  RxWrapper.swift
//  CountryPicker
//
//  Created by Pouya Yarandi on 11/6/20.
//  Copyright © 2020 RoundTable. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

@propertyWrapper
struct RxBehaviorRelay<Element> {
    var behaviorRelay: BehaviorRelay<Element>
    
    init(value: Element) {
        behaviorRelay = BehaviorRelay<Element>(value: value)
    }
    
    var wrappedValue: Element {
        get {
            behaviorRelay.value
        }
        set {
            behaviorRelay.accept(newValue)
        }
    }
    
    var projectedValue: BehaviorRelay<Element> {
        behaviorRelay
    }
}
