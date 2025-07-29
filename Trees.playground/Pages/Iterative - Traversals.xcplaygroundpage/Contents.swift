
import Foundation

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


func iterativeInOrder(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    var stack: [TreeNode] = []
    var node = root
    
    while !stack.isEmpty || node != nil {
         
        while let current = node {
            stack.append(current)
            node = current.left
        }
        
        let lastNode = stack.removeLast()
        result.append(lastNode.val)
        
        node = lastNode.right
    }
    return result
}


func iterativePreOrder(_ root: TreeNode?) -> [Int] {
    var result : [Int] = []
    guard let root = root else { return result }
    var stack = [TreeNode]()
    stack.append(root)
    
    while !stack.isEmpty {
        
        let node = stack.removeLast()
        result.append(node.val)
        
        if let right = node.right {
            stack.append(right)
        }
        
        if let left = node.left {
            stack.append(left)
        }
    }
    
    return result
}

func iterativePostOrder(_ root: TreeNode?) -> [Int] {
    var result: [Int] = []
    guard let root =  root else { return result }
    var stack = [TreeNode]()
    stack.append(root)
    
    while !stack.isEmpty {
        
        let node = stack.removeLast()
        result.append(node.val)
        
        if let left = node.left {
            stack.append(left)
        }
        
        if let right = node.right {
            stack.append(right)
        }
        
    }
    
    return result.reversed()
}

let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.left = TreeNode(4)
root.left?.right = TreeNode(5)
root.right?.left = TreeNode(6)
root.right?.right = TreeNode(7)

let result1 = iterativeInOrder(root)
let result2 = iterativePreOrder(root)
let result3 = iterativePostOrder(root)
print(result1)
print(result2)
print(result3)
