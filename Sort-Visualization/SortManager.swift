//
//  SortManager.swift
//  Sort-Visualization
//
//  Created by Roy Falk on 23/05/2023.
//

import Foundation

func getSortAlgorithm(index:Int, array:[Int])->AbstractSort {
    switch(index) {
    case 0: return QuickSort(array: array)
    case 1: return MergeSort(array: array)
    default: return AbstractSort(array: array)
    }
}


let sortNames = ["Quick Sort (Swift)", "Merge Sort (Swift)", "Dodo", "Dada", "Didi", "Dudu"]

class ChartDataItem: ObservableObject, Identifiable {
    var x: Int
    var y: Int
    var id = UUID()

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

class ChartData: ObservableObject {
    let name: String
    var moves: Int = 0
    var array: [Int]
    
    init(name:String, array: [Int]) {
        self.name = name
        self.array = array
    }
    
    
    
    
    func swap(a: Int, b:Int) {
        DispatchQueue.main.async {
            self.moves += 1
            let temp = self.array[a]
            self.array[a] = self.array[b]
            self.array[b] = temp
            
            self.objectWillChange.send()
        }
    }
}
