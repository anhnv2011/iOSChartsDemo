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
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Get and prepare the data
//        let sales = DataGenerator.data()
//        
//        // Initialize an array to store chart data entries (values; y axis)
//        var salesEntries = [ChartDataEntry]()
//        
//        // Initialize an array to store months (labels; x axis)
//        var salesMonths = [String]()
//        
//        var i = 0
//        for sale in sales {
//            // Create single chart data entry and append it to the array
//            let saleEntry = BarChartDataEntry(x: Double(i), y: sale.value, data: salesMonths as AnyObject?)
//            
////            let saleEntry = BarChartDataEntry(x: Double(i), y: sale.value)
//            salesEntries.append(saleEntry)
//            
//            // Append the month to the array
//            salesMonths.append(sale.month)
//            
//            i += 1
//            
//        }
//        
//        
//        // Create bar chart data set containing salesEntries
//        let chartDataSet = BarChartDataSet(values: salesEntries, label: "kjhfjgcjgc")
//        
//        // Create bar chart data with data set and array with values for x axis
//        let chartData = BarChartData(dataSets: [chartDataSet])
//        
////            BarChartData(xVals: salesMonths, dataSets: [chartDataSet])
//        
//        // Set bar chart data to previously created data
//        barChartView.data = chartData
//        
//        
//        
//        barChartView.descriptionText = ""
//        
//    }
//}

//    
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

        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        
        let chartData = BarChartData()
        chartData.addDataSet(chartDataSet)
        chartDataSet.colors = ChartColorTemplates.colorful()
        barChartView.data = chartData
        barChartView.xAxis.valueFormatter = xaxis.valueFormatter
        barChartView.xAxis.labelPosition = .bottom
        barChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        barChartView.drawBarShadowEnabled = true
        barChartView.animate(xAxisDuration: 1)
        
        
    
        let ll = ChartLimitLine(limit: 12, label: "Target")
        barChartView.rightAxis.addLimitLine(ll)
    }
    

    
}
