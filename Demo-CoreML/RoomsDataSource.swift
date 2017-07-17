//
//  RoomsDataSource.swift
//  Demo-CoreML
//
//  Created by Steven Prichard on 2017-07-15.
//  Copyright © 2017 Steven Prichard. All rights reserved.
//

import Foundation

struct RoomsDataSource {
    private let items = Array(0...10)
    
    // Keep track of the count of the items
    var count : Int{
        return items.count
    }
    
    // TODO: Find this out
    // Is 'for' an external name and 'index' and internal name?
    func title(for index: Int) -> String? {
        guard index < items.count else {return nil}
        return String(items[index])
    }
    
    // Get the value of an item at a specific index
    func value(for index : Int) -> Double? {
        guard index < items.count else {return nil}
        return Double(items[index])
    }
}
