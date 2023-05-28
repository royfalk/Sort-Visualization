//
//  MergeSort.swift
//  Sort-Visualization
//
//  Created by Roy Falk on 15/05/2023.
//

import Foundation

// Source: https://en.wikipedia.org/wiki/Merge_sort
class MergeSort : AbstractSort {
    var arrayForMove = [[(Int,Int)]]()
    
    func appendArrayForMove() {
        arrayForMove.append(currentArray.enumerated().map {
            ($0,$1)
        })
    }
    
    override func getNumberOfMoves() -> Int {
        return arrayForMove.count
    }
    
    override func getArrayForMove(move: Int) -> [(Int, Int)] {
        print("MFM \(move) \(arrayForMove.count)")
        return arrayForMove[move]
    }
    
    override init(array: [Int]) {
        super.init(array: array)
        self.name = "Merge Sort (Swift)"
    }
    
    override func sort() {
        let start = Date()
        mergeSort(low: 0, high: currentArray.count-1)
        print(start.timeIntervalSinceNow)
        printArray()
    }
    
    func mergeSort(low:Int, high:Int) {
        if low == high {
            return
        }
        
        if low+1 == high {
            if currentArray[low] > currentArray[high] {
                currentArray.swapAt(low, high)
                appendArrayForMove()
            }
            
            return
        }
        
        let middle = (high+low)/2
        
        mergeSort(low: low, high: middle)
        mergeSort(low: middle+1, high: high)
        
        var i1 = low
        var i2 = middle+1
        
        var copyArray = [Int](repeating: 0, count: high - low + 1)
        
        for i in 0..<copyArray.count {
            if i1 > middle {
                copyArray[i] = currentArray[i2]
                i2 += 1
            } else if i2 > high {
                copyArray[i] = currentArray[i1]
                i1 += 1
            } else if currentArray[i1] > currentArray[i2] {
                copyArray[i] = currentArray[i2]
                i2 += 1
            } else {
                copyArray[i] = currentArray[i1]
                i1 += 1
            }
        }
        
        for i in 0..<copyArray.count {
            currentArray[low+i] = copyArray[i]
            appendArrayForMove()
        }
    }
}



