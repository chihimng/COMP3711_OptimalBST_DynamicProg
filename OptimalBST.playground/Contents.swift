import UIKit

func printTable (array:[[Int]]) {
    for i in 1...8 {
        for j in 1...8 {
            print("\(array[i][j]) ", terminator:"")
        }
        print("")
    }
    print("")
}

func w (_ i:Int, _ j:Int) -> Int {
    var temp = 0
    for k in i...j {
        temp += f[k]
    }
    return temp
}


let f:[Int] = [0,4,2,1,2,3,1,2,1] // 0-th item is not used

var e:[[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: 10)

var root:[[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: 10)

for i in 1...8 {
    e[i][i] = f[i]
    root[i][i] = i
}

for l in 1...8 {
    for i in 1...(8-l+1) {
        let j = i + l - 1
        e[i][j] = Int.max
        for k in i...j {
            let t = e[i][k-1] + e[k+1][j] + w(i, j)
            if t < e[i][j] {
                e[i][j] = t
                root[i][j] = k
            }
        }
    }
}

printTable(array: e)
printTable(array: root)
