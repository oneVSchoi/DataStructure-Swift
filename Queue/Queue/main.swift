//
//  main.swift
//  Queue
//
//  Created by 최원대 on 2022/04/27.
//

import Foundation


struct Queue<T> {
    private var queue: [T?] = [] // 배열에 nil을 설정할 수 있기 때문에 T에서 T?로 자료형을 변경한다.
    private var head = 0 // dequeue 연산시 사용되는 head 포인터
    
    // 큐에 담겨 있는 자료의 개수
    // 배열의 개수에서 head를 빼주어야 한다.
    var count: Int {
        return queue.count - head
    }
    
    // 큐가 비어있는지를 체크하기 위한 연산 프로퍼티
    // count 연산 프로퍼티가 0일 경우 큐가 비어있다고 볼 수 있다.
    var isEmpty: Bool {
        return count == 0
    }
    
    // 배열의 append(_:) 연산을 사용하여 큐의 끝에 자료 삽입
    mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    // 큐가 비어있다면 nil을 반환 - 큐에 자료가 있다면 배열의 removeFirst() 메서드를 사용하여 앞에 있는 자료 삭제
    mutating func dequeue() -> T? {
        guard head < queue.count, let element = queue[head] else { return nil }
        
        // 현재 head가 가리키고 있는 배열의 element를 nil로 설정하고 head 포인터를 이동시킨다.
        queue[head] = nil
        head += 1
        
        let percentage = Double(head) / Double(queue.count)
        if queue.count > 50, percentage > 0.25 { // 배열의 비어있는 요소가 많아질 경우 비어있는 부분을 제거해주는 작업을 한다.
            queue.removeFirst(head)
            head = 0
        }
        
        return element
    }
}
