//
//  StackDataStructure.swift
//  StackOperations
//
//  Created by sanooj on 11/4/17.
//

import Foundation

///Stack dataStructure
struct Stack<T:Comparable>:StackOperation
{
    typealias Element = T
    
    //data store
    private var dataStore:[T] =
        []
    
    var isEmpty: Bool
    {
        return self.dataStore.isEmpty
    }
    
    var count: Int
    {
        return self.dataStore.count
    }
    
    mutating func push(_ element: T)
    {
        self.dataStore.append(element)
    }
    
    @discardableResult
    mutating func pop() -> T?
    {
        return self.dataStore.popLast()
    }
    
    func peek() -> T?
    {
        return self.dataStore.last
    }
    
    func object(atIndex index: Int) -> T?
    {
        if index < self.dataStore.count
        {
            return self.dataStore[index]
        }
        
        return nil
    }
    
    mutating func sort()
    {
        self.dataStore =
        self.dataStore.sorted()
    }
    
    mutating func clear() {
        self.dataStore.removeAll()
    }
}
