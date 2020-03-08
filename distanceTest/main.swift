//
//  main.swift
//  distanceTest
//
//  Created by Mark Lively on 3/6/20.
//  Copyright © 2020 xxx. All rights reserved.
//

import Foundation

func sort<T: Comparable>(input:Array<T>, k:Int) -> Array<T> {
//    return Array(input.sorted().prefix(upTo: k))
    let out = Array(input.sorted()[0..<k])
    return out
}

func array<T: Comparable>(input:Array<T>, k:Int) ->Array<T> {
    var out = input[0..<k].sorted()
    var max = out.max()!
    for e in input[k...] {
        if e < max {
            var i = k - 1
            while i >= 1 && out[i-1] > e {
                out[i] = out[i-1]
                i -= 1
            }
            out[i] = e
            max = out.last!
        }
    }
    return out
}

let input = [0.1, 0.4, 0.7, 0.0, 0.3, 0.6, 0.9, 0.2, 0.5, 0.8]
assert(array(input: input, k: 1) == sort(input: input, k: 1))
assert(array(input: input, k: 3) == sort(input: input, k: 3))
assert(array(input: input, k: 5) == sort(input: input, k: 5))
assert(array(input: input, k: 10) == sort(input: input, k: 10))
print (array(input: input, k: 5))

var backwards:Array<Int> = []
for i in 0..<10_000{backwards.insert(i, at: 0)}
for k in [1,10,100,1000,5000,9000]{
    var d = Date()
    _ = sort(input:backwards, k:k)
    let t1 = d.timeIntervalSinceNow
    d = Date()
    _ = array(input:backwards, k:k)
    let t2 = d.timeIntervalSinceNow
    print (backwards.count, k, t1, t2)
}

//Million elements.  This can take hours.

let t = 1_000_000
var unsorted:Array<Double> = []
for _ in 0..<t{unsorted.append(Double.random(in:0.0..<10.0))}
for k in [1,10,100,1000,10_000,100_000,500_000,900_000,990_000,999_000]{
    var d = Date()
    _ = sort(input:unsorted, k:k)
    let t1 = d.timeIntervalSinceNow
    d = Date()
    _ = array(input:unsorted, k:k)
    let t2 = d.timeIntervalSinceNow
    print (unsorted.count, k, t1, t2)
}
