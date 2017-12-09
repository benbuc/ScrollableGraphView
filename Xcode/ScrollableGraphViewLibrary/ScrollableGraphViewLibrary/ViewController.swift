//
//  ViewController.swift
//  ScrollableGraphViewLibrary
//
//  Created by Benito Buchheim on 08.12.17.
//  Copyright © 2017 mission eins UG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ScrollableGraphViewDataSource {
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> TimeBasedDataPoint {
        return data[pointIndex]
    }
    
    func label(atIndex pointIndex: Int) -> String {
        return "\(data[pointIndex].time)"
    }
    
    func numberOfPoints() -> Int {
        return data.count
    }
    
    func getAllPoints() -> [TimeBasedDataPoint] {
        return data
    }
    
    
    @IBOutlet weak var chartView: ScrollableGraphView!
    
    var data: [TimeBasedDataPoint] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // display an example chart
        
        data = [
            TimeBasedDataPoint(time: 0, value: 10),
            TimeBasedDataPoint(time: 10, value: 20),
            TimeBasedDataPoint(time: 50, value: 50),
            TimeBasedDataPoint(time: 75, value: 60),
            TimeBasedDataPoint(time: 100, value: 100)
        ]
        
        chartView.dataSource = self
        chartView.leftmostPointPadding = 10.0
        chartView.rightmostPointPadding = 10.0
        
        let testPlot = LinePlot(identifier: "testPlot")
        testPlot.lineWidth = 3
        testPlot.lineColor = UIColor.white
        testPlot.lineStyle = ScrollableGraphViewLineStyle.smooth
        testPlot.shouldFill = true
        testPlot.fillType = ScrollableGraphViewFillType.gradient
        testPlot.fillColor = UIColor.white
        testPlot.fillGradientStartColor = UIColor.white.withAlphaComponent(0.8)
        testPlot.fillGradientEndColor = self.view.backgroundColor!
        testPlot.adaptAnimationType = ScrollableGraphViewAnimationType.easeOut
        
        // Setup the reference lines
        let referenceLines = ReferenceLines()
        referenceLines.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 12)
        referenceLines.referenceLineColor = UIColor.white.withAlphaComponent(0.2)
        referenceLines.referenceLineLabelColor = UIColor.white
        referenceLines.dataPointLabelColor = UIColor.white.withAlphaComponent(1.0)
        
        // setup the graph
        chartView.backgroundFillColor = self.view.backgroundColor!
        
        // Make a data point for every day
        chartView.shouldAnimateOnStartup = true
        chartView.shouldAdaptRange = false
        chartView.yRangeMax = 100.0
        chartView.yRangeMin = 0.0
        chartView.shouldRangeAlwaysStartAtZero = true
        // let the newest result be visible (without it start at the left -> user has to scroll first)
        //chartView.direction = .rightToLeft
        
        
        // Add everything to the graph
        chartView.addReferenceLines(referenceLines: referenceLines)
        chartView.addPlot(plot: testPlot)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

