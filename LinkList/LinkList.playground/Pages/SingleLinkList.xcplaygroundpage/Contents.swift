//: [Previous](@previous)

import Foundation

/// 单链表的节点
class SingleLinkNode {
    
    /// 下一个节点
    var next : SingleLinkNode?
    
    /// 节点值， 0 表示指向为 nil
    var value : Int
    
    init(value: Int = 0) {
        self.value = value
    }
    
    /// 节点值是否相同
    ///
    /// - Parameter value: 节点值
    /// - Returns: 是否相同
    func equal(value: Int) -> Bool {
        return self.value == value
    }
}

/// 单链表，一种线性表，可由不连续的节点组成，节点中存储当前节点的值，以及下一个节点的地址。
struct SingleLinkList {
    
    /// 头节点
    var head : SingleLinkNode?
    
    /// 尾节点
    var tail : SingleLinkNode?
    
    /// 尾插法：把节点插入到最后
    ///
    /// - Parameter value: 要插入节点的值
    mutating
    func appendAfterTail(_ value: Int) {
        
        let node = SingleLinkNode(value: value)
        
        if let tail = tail {
            // tail != nil
            tail.next = node
            self.tail = tail.next
        } else {
            
            tail = node
            head = tail
            
        }
    }
    
    /// 头插法：把节点插到最前
    ///
    /// - Parameter value: 要插入节点的值
    mutating
    func appendBeforeHead(_ value: Int) {
        
        let node = SingleLinkNode(value: value)
        
        if let head = head {
            // head ！= nil
            node.next = head
            self.head = node
            
        } else {
            
            head = node
            tail = head
        }
    }
    
    /// 逆序反转
    mutating
    func reverse() {
        
        // 空链表 和 只有一个节点的链表。反转无意义啊。。XD
        guard head != nil || head?.next != nil else { return }
        
        // 指向第一个节点
        var current : SingleLinkNode? = head
        // 前一个节点。对于 head 而言，前一个节点为 nil
        var prex : SingleLinkNode?
        
        // current 不为 nil 时，进行遍历
        while current != nil {
            // 下一个节点
            let tmp : SingleLinkNode? = current?.next
            // 调转方向，使得 current.next 为 prex
            current?.next = prex
            // 前进一个节点
            prex = current
            // 前进一个节点
            current = tmp
        }
        // head 指向先前的节点，因为 current 为 nil 时，则刚好是 tail
        head = prex
    }
    
    /// 中间节点
    var middleNode : SingleLinkNode? {
        
        // 可以考虑利用快慢指针
        // 即 slowNode 前进一个节点，fastNode 前进两个节点。这样等到 fastNode 走到尾节点，则 fastNode 为 nil 时，slowNode 则刚好是中间节点。如果链长是奇数，那么 slowNode 刚好居中，反之 slowNode 是中间节点，或者 slowNode.next 也是中间节点
        
        // 空链表 和 只有一个节点或者两个节点的链表。。。XD
        guard head != nil
            && head?.next != nil
            && head?.next?.next != nil
            else { return nil }
        
        // 慢指针
        var slowNode : SingleLinkNode? = head
        // 快指针
        var fastNode : SingleLinkNode? = head?.next?.next

        while fastNode != nil {
            // slowNode 前进一个节点
            slowNode = slowNode?.next
            // fastNode 前进两个节点
            fastNode = fastNode?.next?.next
        }
        
        return slowNode
    }
    
    /// 是否回文
    var isPalindrome : Bool {
        
        // 保证两个节点以上
        guard head != nil && head?.next != nil else { return false }
        
        // 考虑用快慢指针找到中间节点的同时，把前半段链表进行倒序，然后再遍历进行比较
        var prev : SingleLinkNode?              // 用于记录前半段链表逆序
        var slowNode = head                     // 慢指针，一次前进一个节点
        var fastNode = head         // 快指针，一次前进两个节点
        
        while fastNode != nil && fastNode?.next != nil {
            
            fastNode = fastNode?.next?.next     // fastNode 前进两个节点
            
            let slowNodeNext = slowNode?.next   // slowNode 的下一个节点
            
            // 对 prev 进行赋值，从而达到前半段链表逆序
            slowNode?.next = prev
            prev = slowNode
            
            slowNode = slowNodeNext             // slowNode 前进一个节点
            
        }
        
        if fastNode != nil {
            // 奇数个，此时 slowNode 刚好位于中间节点，那么后半段链表需要从下一个节点开始
            slowNode = slowNode?.next
        }
        
        var result = true                       // 结果，是否回文
        
        // 开始进行比较咯
        while slowNode != nil {
            
            prev?.value
            
            slowNode?.value
            
            // 二者相同才会继续往下执行
            guard prev!.equal(value: slowNode!.value) else {
                result = false
                break
            }
            
            // 前进下一个节点
            prev = prev?.next
            // 前进下一个节点
            slowNode = slowNode?.next
            
        }
        
        return result
    }
    
    
    
}

extension SingleLinkList {
    /// 描述信息
    var description : String {
        
        var str : String = "["
        
        var tmp : SingleLinkNode? = head
        
        while tmp != nil {
            str += String(tmp!.value)
            tmp = tmp?.next
            if tmp != nil { str += "," }
        }
        
        return str + "]"
    }
}


var linkList = SingleLinkList()

linkList.appendAfterTail(1)
linkList.appendAfterTail(2)
linkList.appendAfterTail(5)
linkList.appendAfterTail(5)
linkList.appendAfterTail(2)
linkList.appendAfterTail(1)

linkList.description

linkList.reverse()

linkList.description

linkList.middleNode?.value

linkList.isPalindrome



let timer : DispatchSourceTimer = DispatchSource.makeTimerSource()

timer.schedule(wallDeadline: .now(), repeating: 1)

var i = 0
let workItem = DispatchWorkItem {
    print("test")
    i += 1
    
    if i == 10 {
        timer.cancel()
    }
    
}

timer.setEventHandler(handler: workItem)


timer.resume()



