//
//  ChartsView.swift
//  Sort-Visualization
//
//  Created by Roy Falk on 16/05/2023.
//

import SwiftUI
import Charts

let mockArray: [Int] = generateMockChartData(minX: 0, minY: 0, maxX: 10, maxY: 25)

let array:[ChartDataItem] = mockArray.enumerated().map {
    ChartDataItem(x: $0, y: $1)
}

struct ChartsView: View {
    
    let rows:Int = 3
    let columnsPerRow:Int = 2
    
    var body: some View {
        GridLayout{
            ForEach(0..<3) {
                row in
                GridRow {
                    ForEach(0..<2) {
                        column in
                        let index = row * columnsPerRow + column
    
                        SortChartView(index: index, sort: getSortAlgorithm(index: index, array: mockArray))
                    }
                }
            }
        }
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}

struct SortChartView: View {
    let index:Int
    let sort:AbstractSort
    let timer = Timer.publish(every: 0.21, on: .main, in: .common).autoconnect()
        
    @State var items:[ChartDataItem] = array
    @State var moves:Int = 0
    
    var body: some View {
        VStack {
            Text(sort.name).bold().font(.headline)
            Chart {
                ForEach(items) { datum in
                    BarMark(
                        x: .value("X", datum.x),
                        y: .value("Y", datum.y)
                    )
                }
            }.padding(10.0)
                .chartYScale(domain: 0...25)
            Text("\(moves) (\(sort.time))").font(.footnote)
        }.onAppear {
            
            
            DispatchQueue.global(qos: .userInitiated).async {
                sort.sort()
            }
        }.onReceive(timer) { i in
            if moves == sort.getNumberOfMoves() {
                self.timer.upstream.connect().cancel()
                return
            }
            
            items = sort.getArrayForMove(move: moves).map {
                ChartDataItem(x: $0, y: $1)
            }
            
            moves = min(sort.getNumberOfMoves(), moves+1)
        }
    }
}
