//: [Previous](@previous)

import Foundation
import GLKit

var str = "Hello, playground"

//: [Next](@next)


let arr = [1,4,5]

let a = "string"

let startIndex = a.startIndex
let endIndex = a.index(a.startIndex, offsetBy: 2)
let b = a[startIndex...endIndex]

extension String {
    
    func subString(_ from: Int = 0, offset: Int) -> String {
        
        if from == 0 {
            
        }
        
        let fromIndex = self.index(self.startIndex, offsetBy: from)
        
        var newOffset = offset
        
        if from + newOffset >= self.count {
            newOffset = self.count
        }
        
        return String(self[fromIndex...self.index(self.startIndex, offsetBy: offset)])
        
    }
    
}

struct Vertor {
    
    var position : GLKVector3
    var texture : GLKVector2
    
}

MemoryLayout<GLKVector3>.size

MemoryLayout<GLKVector2>.size

MemoryLayout<Vertor>.offset(of: \Vertor.position)

MemoryLayout<Vertor>.offset(of: \Vertor.texture)




