import UIKit

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}


func levelOrder(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    guard let root = root else { return result }
    var queue: [TreeNode] = []
    queue.append(root)
    
    while !queue.isEmpty {
        
        let current = queue.removeFirst()
        result.append(current.val)
        
        if let left = current.left {
            queue.append(left)
        }
        
        if let right = current.right {
            queue.append(right)
        }
        
    }
    return result
}

func zigZag(_ root: TreeNode?) -> [[Int]] {
    var result = [[Int]]()
    guard let root = root else { return result }
    var queue : [TreeNode] = []
    queue.append(root)
    var direction = true
    
    while !queue.isEmpty {
        let levelSize = queue.count
        var level : [Int] = []
        
        for _ in 0..<levelSize {
            
            let current = queue.removeFirst()
            level.append(current.val)
            
            if let left = current.left {
                queue.append(left)
            }
            
            if let right = current.right {
                queue.append(right)
            }
        }
        
        result.append(direction ? level : level.reversed())
        direction.toggle()
    }
    return result
}

let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.left = TreeNode(4)
root.left?.right = TreeNode(5)
root.right?.left = TreeNode(6)
root.right?.right = TreeNode(7)

let result1 = levelOrder(root)
let result2 = zigZag(root)
print(result1)
print(result2)
