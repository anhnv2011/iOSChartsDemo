//
//  BarChartViewController.swift
//  iOSChartsDemo
//
//  Created by Joyce Echessa on 6/12/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import Charts


class BarChartViewController: UIViewController {
    //@IBOutlet weak var barChartView: BarChartView!
    
    @IBOutlet var barChartView: BarChartView!
    

   var avgUnit = 0.0
    public class BarChartFormatter: NSObject, IAxisValueFormatter{
        
        var months: [String]! = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        
        
        public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
            
            return months[Int(value)]
        }
    }
    
    var months: [String]! = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    override func viewDidLoad() {

        super.viewDidLoad()
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
//        BarChartFormatter()
        var totalunit = 0.0
        for i in unitsSold
        {
            totalunit += i
        }
        print(totalunit)
        avgUnit = totalunit/(Double(months.count))
        print(avgUnit)
        
        setChart(dataPoints: months, values: unitsSold)
        
       
    }
   
   
    func setChart(dataPoints: [String], values: [Double]) {
        
        let formato:BarChartFormatter = BarChartFormatter()
        let xaxis:XAxis = XAxis()
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i), y:values[i], data: months as AnyObject? )
            dataEntries.append(dataEntry)
            formato.stringForValue(Double(i), axis: xaxis)

        }
        xaxis.valueFormatter = formato

        let chartDataSet = BarChartDataSet(values: dataEntries, label: "number food")
        
        let chartData = BarChartData()
        chartData.addDataSet(chartDataSet)
        chartDataSet.colors = ChartColorTemplates.colorful()
        barChartView.data = chartData
        barChartView.xAxis.valueFormatter = xaxis.valueFormatter
        barChartView.xAxis.labelPosition = .bottom
        barChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        barChartView.drawBarShadowEnabled = true
        barChartView.animate(xAxisDuration: 2)
        
        
    
        let ll = ChartLimitLine(limit: avgUnit , label: "Avg")
        barChartView.rightAxis.addLimitLine(ll)
    }
    

    
}
