//
//  AbstractSort.swift
//  Sort-Visualization
//
//  Created by Roy Falk on 15/05/2023.
//

import Foundation

class AbstractSort {
    var name:String
    let initialArray: [Int]
    var currentArray: [Int]
    var time: TimeInterval
    
    init(array: [Int]) {
        name = "Dummy"
        initialArray = array
        currentArray = array
        time = 0
    }
    
    func sort() {
        // Do nothing
    }
    
//    func swap(index1:Int, index2:Int) {
//        moves.append((index1, index2))
//        currentArray.swapAt(index1, index2)
//    }
    
    func printArray() {
        var string:String = "\(name) \(getNumberOfMoves()) : "
        for i in 0..<currentArray.count {
            string += "\(currentArray[i]) "
        }

        print(string)
    }
    
    func getNumberOfMoves() -> Int {
        return 0
    }
    
    func getArrayForMove(move:Int)->[(Int, Int)] {
        return [(Int,Int)]()
    }
}
