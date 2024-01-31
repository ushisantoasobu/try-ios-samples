import UIKit

var greeting = "Hello, playground"

let colors = [
    0,1,2,3,4,5,6,7,8,9
]
let maxColumnCount: Int = 5
let rowCount = Int(ceil(CGFloat(colors.count) / CGFloat(maxColumnCount)))
print("rowCount \(rowCount)")
for rowIndex in 0..<rowCount {
    let columnCount: Int = min(colors.count - rowIndex * maxColumnCount, maxColumnCount)
    print("columnCount \(columnCount)")
    for columnIndex in 0..<columnCount {
        let index = rowIndex * maxColumnCount + columnIndex
        print(index)
    }
}

