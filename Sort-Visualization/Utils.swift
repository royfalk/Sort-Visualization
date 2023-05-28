//
//  Utils.swift
//  Sort-Visualization
//
//  Created by Roy Falk on 17/05/2023.
//

import Foundation



func generateMockChartData(minX:Int, minY:Int, maxX:Int, maxY:Int)->[Int] {

    var chartData = [Int]()
        
    if(minX<=maxX && minY<=maxY) {
        for _ in minX...maxX {
            chartData.append(Int.random(in: minY...maxY))
        }
        
    }
    
    return chartData
}
