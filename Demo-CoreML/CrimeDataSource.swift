//
//  CrimeDataSource.swift
//  Demo-CoreML
//
//  Created by Steven Prichard on 2017-07-15.
//  Copyright © 2017 Steven Prichard. All rights reserved.
//

import Foundation

struct CrimeDateSource{
    let rates = Array(stride(from: 0.0, to: 0.2, by: 0.01))
    
    //Computed Property?
    var count: Int {
        return rates.count
    }
    
    // Gets us the title
    func title(for index: Int) -> String? {
        guard index < rates.count else{return nil}
        return String(rates[index])
    }
    
    // Gets us the value
    func value(for index: Int) -> Double? {
        guard index < rates.count else {return nil}
        return rates[index]
    }
}
