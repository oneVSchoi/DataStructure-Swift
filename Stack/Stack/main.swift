//
//  main.swift
//  Stack
//
//  Created by 최원대 on 2022/04/17.
//

import Foundation

struct Stack<T> {
    // 스택의 요소들을 담아두는 배열
    var elements: [T] = []
    
    // 스택에 몇 개의 요소들이 있는지를 체크하는 연산 프로퍼티
    var count: Int {
        return elements.count
    }
    
    // 스택이 비어있는 지를 체크하는 연산 프로퍼티
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    // 스택에 입력으로 받은 element를 push
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    // 스택의 가장 위에 있는 요소(배열의 마지막 요소)를 삭제하며 리턴
    mutating func pop() -> T? {
        return elements.popLast()
    }
    
    // 스택의 가장 위에 있는 요소(배열의 마지막 요소)
    func top() -> T? {
        return elements.last
    }
}

