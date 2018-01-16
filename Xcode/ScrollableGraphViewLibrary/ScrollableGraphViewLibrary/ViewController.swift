//
//  ViewController.swift
//  ScrollableGraphViewLibrary
//
//  Created by Benito Buchheim on 16.01.18.
//  Copyright © 2018 mission eins UG. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ScrollableGraphViewDataSource {
    
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        if plot.identifier == "easyPlot" {
            return Double(easyPlotData[pointIndex].1)
        }
        
        return 0
    }
    
    func label(atIndex pointIndex: Int) -> String {
        // Just give a label for the first and last data point
        
        return String(pointIndex)
    }
    
    func numberOfPoints() -> Int {
        return easyPlotData.count
    }
    
    @IBOutlet weak var chartView: ScrollableGraphView!
    var easyPlotData: [(TimeInterval, Int)]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        easyPlotData = [
            (1, 15),
            (2, 30),
            (3, 80),
            (4, 20),
            (5, 100)
        ]
        
        chartView.dataSource = self
        chartView.leftmostPointPadding = 10.0
        chartView.rightmostPointPadding = 10.0
        
        let easyPlot = LinePlot(identifier: "easyPlot")
        easyPlot.lineWidth = 3
        easyPlot.lineColor = UIColor.white
        easyPlot.lineStyle = ScrollableGraphViewLineStyle.smooth
        easyPlot.shouldFill = true
        easyPlot.fillType = ScrollableGraphViewFillType.gradient
        easyPlot.fillColor = UIColor.white
        easyPlot.fillGradientStartColor = UIColor.white.withAlphaComponent(0.8)
        easyPlot.fillGradientEndColor = self.view.backgroundColor!
        easyPlot.adaptAnimationType = ScrollableGraphViewAnimationType.easeOut
        
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
        chartView.rangeMax = 100.0
        chartView.rangeMin = 0.0
        chartView.shouldRangeAlwaysStartAtZero = true
        // let the newest result be visible (without it start at the left -> user has to scroll first)
        chartView.direction = .rightToLeft
        
        // Add everything to the graph
        chartView.addReferenceLines(referenceLines: referenceLines)
        chartView.addPlot(plot: easyPlot)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

