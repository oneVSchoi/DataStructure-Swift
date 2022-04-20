import Foundation

class Node<T: Equatable> {
    let data: T
    var next: Node?
    
    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

struct LinkedList<T: Equatable> {
    var head: Node<T>?
    
    func printList() {
        var now = head
        
        print("===== Linked List =====")
        while now != nil {
            now?.next == nil
            ? print("data : \(String(describing: now?.data))")
            : print("data : \(String(describing: now?.data)) -> ")
            
            now = now?.next
        }
        print("========== End print ==========")
    }
    
    func searchNode(data: T) -> Node<T>? {
        var now = head
        
        while now?.data != data && now != nil {
            now = now?.next
        }
        return now
    }
    
    // 마지막에 데이터 추가
    mutating func append(data: T) {
        let newNode = Node(data: data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var now = head
        
        while now?.next != nil {
            now = now?.next
        }
        
        now?.next = newNode
    }
    
    // 지정된 위치에 데이터 추가
    mutating func insert(data: T, at idx: Int) {
        let newNode = Node(data: data)
        
        if head == nil {
            head = newNode
            return
        } else if idx-2 < 0 {
            append(data: data)
            return
        }
        
        var now = head
        
        for _ in 0...idx-2 {
            now = now?.next
        }
        
        newNode.next = now?.next
        now?.next = newNode
    }
    
    // 가장 마지막 노드 삭제
    mutating func removeLast() {
        if head == nil { return }
        
        if head?.next == nil {
            head = nil
            return
        }
        
        var now = head
        while now?.next?.next != nil {
            now = now?.next
        }
        
        now?.next = nil
    }
    
    // 지정한 위치의 노드 삭제
    mutating func delete(at idx: Int) {
        if head == nil { return }
        
        if idx == 0 || head?.next == nil {
            head = head?.next
            return
        }
        
        var now = head
        
        for _ in 0..<idx-1 {
            if now?.next?.next == nil { break }
            now = now?.next
        }
        
        now?.next = now?.next?.next
        now?.next?.next = nil
    }
}
