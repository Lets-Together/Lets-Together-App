//
//  WorkoutObservers.swift
//  LetsTogether
//
//  Created by Mateus Nobre on 16/09/21.
//

import Foundation

typealias CompletionHandler = (() -> Void)

class WorkoutObservers<T> {
    
    var value: T {
        didSet {
            self.notify()
        }
    }
    
    private var observers = [String: CompletionHandler]()
    
    init(_ value: T) {
        self.value = value
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        addObserver(observer, completionHandler: completionHandler)
        notify()
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    public func notify() {
        observers.forEach { $0.value() }
    }
    
}
