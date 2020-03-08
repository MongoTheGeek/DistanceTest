//
//  main.swift
//  testSort
//
//  Created by Mark Lively on 3/6/20.
//  Copyright © 2020 xxx. All rights reserved.
//


import Foundation
var out:Array<Double> = []
var n:Array<Int> = []
for _ in 0...10 {out.append(0.0)}
for _ in 0...10 {n.append(0)}
for _ in 0..<1000 {
    var t = 10
    var unsorted:Array<Double> = []
    for _ in 0...t{unsorted.append(Double.random(in:0.0..<1.0))}
    for i in 0...10 {
        for _ in 0...t{unsorted.append(Double.random(in:0.0..<1.0))}
        t *= 2
        n[i] = unsorted.count
        let date = Date()
        let sorted = unsorted.sorted()
        let k = Double(sorted.count)
        out[i] += date.timeIntervalSinceNow/k/log(k)
    }
}

for i in 0..<n.count {
    print("\(n[i])\t\(out[i])")
}

