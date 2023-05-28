//
//  QuickSort.swift
//  Sort-Visualization
//
//  Created by Roy Falk on 15/05/2023.
//

import Foundation

// Source: https://en.wikipedia.org/wiki/Quicksort
class QuickSort: AbstractSort {
    private var moves: [(Int, Int)]

    override init(array: [Int]) {
        moves = [(Int,Int)]()
        super.init(array: array)
        self.name = "Quick Sort (Swift)"
    }
    
    override func sort() {
        quickSort(low: 0, high: currentArray.count-1)
        printArray()
    }
    
    // Sorts a (portion of an) array, divides it into partitions, then sorts those
    func quickSort(low:Int, high:Int) {
        // Ensure indices are in correct order
        if low >= high || low < 0 {
            return
        }
        
        // Partition array and get the pivot index
        let pivot = partition(low: low, high: high)
        
        // Sort the two partitions
        quickSort(low: low, high: pivot - 1) // Left side of pivot
        quickSort(low: pivot + 1, high: high) // Right side of pivot
    }
    
    func partition(low:Int, high:Int)->Int {
        // Divides array into two partitions
        let pivot = currentArray[high] // Choose the last element as the pivot
        
        // Temporary pivot index
        var i: Int = low - 1
        
        for j in low..<high {
            // If the current element is less than or equal to the pivot
            let y: Int = currentArray[j]
            if y <= pivot {
                // Move the temporary pivot index forward
                i += 1
                // Swap the current element with the element at the temporary pivot index
                moves.append((i, j))
                currentArray.swapAt(i, j)
            }
            
        }
        
        i += 1
        moves.append((i, high))
        currentArray.swapAt(i, high)
        return i
    }
    
    override func getNumberOfMoves() -> Int {
        return moves.count
    }
    
    override func getArrayForMove(move:Int)->[(Int, Int)] {
        var array = initialArray
        
        for i in 0...move {
            let move = moves[i]
            array.swapAt(move.0, move.1)
        }
        
        print("getArrayForMove \(move) \(moves.count)")
        print(array.description)
        return array.enumerated().map {
            ($0, $1)
        }
    }
}
