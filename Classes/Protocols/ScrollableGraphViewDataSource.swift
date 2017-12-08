
import UIKit

public protocol ScrollableGraphViewDataSource {
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> TimeBasedDataPoint
    func label(atIndex pointIndex: Int) -> String
    func numberOfPoints() -> Int
    func getAllPoints() -> [TimeBasedDataPoint]
}
