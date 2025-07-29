import Foundation


//DFS ==> We go deep into the tree and then backtrack
//1. Inorder ==> Left --> Root --> Right
//2. PreOrder ==> Root --> Left --> Right
//3. PostOrder ==> Left --> Right --> Root


class TreeNode {
    var val : Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func inOrder(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    
    func dfs(_ node: TreeNode?) {
        guard let node =  node else {
            return
        }
        
        dfs(node.left)
        result.append(node.val)
        dfs(node.right)
    }
    
    dfs(root)
    return result
}


func preOrder(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    
    func dfs(_ node: TreeNode?) {
        guard let node = node else { return }
        
        result.append(node.val)
        dfs(node.left)
        dfs(node.right)
    }
    
    dfs(root)
    return result
}


func postOrder(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    
    func dfs(_ node: TreeNode?) {
        guard let node = node else { return }
        
        dfs(node.left)
        dfs(node.right)
        result.append(node.val)
    }
    
    dfs(root)
    return result
}


let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.left = TreeNode(4)
root.left?.right = TreeNode(5)
root.right?.left = TreeNode(6)
root.right?.right = TreeNode(7)

let result1 = inOrder(root)
let result2 = preOrder(root)
let result3 = postOrder(root)
print(result1)
print(result2)
print(result3)


