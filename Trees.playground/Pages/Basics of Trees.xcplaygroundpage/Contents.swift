//: [Previous](@previous)

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


func heightOfTree(_ root: TreeNode?) -> Int {
    var res = 0
    guard let root = root else { return res }
    var node = root
    
    let leftHeight = heightOfTree(node.left)
    let rightHeight = heightOfTree(node.right)
    return max(leftHeight, rightHeight) + 1
}

func countNodes(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    return countNodes(root.left) + countNodes(root.right) + 1
}


func countLeaves(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    if root.left == nil && root.right == nil {
        return 1
    }
    
    let leftLeaves = countLeaves(root.left)
    let rightLeaves = countLeaves(root.right)
    return leftLeaves + rightLeaves
}

func countInternalNodes(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    if root.left == nil && root.right == nil {
        return 0
    }
    
    return countInternalNodes(root.left) + countInternalNodes(root.right) + 1
}

func checkIdentical(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    
    if root1 == nil && root2 == nil {
        return true
    }
    
    if root1 == nil || root2 == nil {
        return false
    }
    
    if root1?.val != root2?.val {
        return false
    }
    
    return checkIdentical(root1?.left, root2?.left) && checkIdentical(root1?.right, root2?.right)
}



let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.left = TreeNode(4)
root.left?.right = TreeNode(5)
root.right?.left = TreeNode(6)
root.right?.right = TreeNode(7)

let root2 = TreeNode(1)
root2.left = TreeNode(2)
root2.right = TreeNode(3)
root2.left?.left = TreeNode(4)
root2.left?.right = TreeNode(5)
root2.right?.left = TreeNode(6)
root2.right?.right = TreeNode(7)


print(heightOfTree(root))
print(countLeaves(root))
print(countNodes(root))
print(countInternalNodes(root))
print(checkIdentical(root, root2))
