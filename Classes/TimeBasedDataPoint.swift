//
//  TimeBasedDataPoint.swift
//  ScrollableGraphViewLibrary
//
//  Created by Benito Buchheim on 08.12.17.
//  Copyright © 2017 mission eins UG. All rights reserved.
//

import Foundation

public class TimeBasedDataPoint: Comparable {
    // containing the time and the data
    
    open var time: TimeInterval
    open var value: Double
    
    init(time: TimeInterval, value: Double) {
        self.time = time
        self.value = value
    }
    
    public static func < (lhs: TimeBasedDataPoint, rhs: TimeBasedDataPoint) -> Bool {
        return lhs.value < rhs.value
    }
    
    public static func == (lhs: TimeBasedDataPoint, rhs: TimeBasedDataPoint) -> Bool {
        return lhs.value == rhs.value
    }
}
