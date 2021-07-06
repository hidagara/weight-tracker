//
//  StringSubscriber.swift
//  weight-tracker
//
//  Created by Media Guest on 06.07.2021.
//

import Foundation
import Combine

class StringSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = Never
    
    func receive(subscription: Subscription) {
        subscription.request(.unlimited)
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received: \(input), Transformed into: \(input.uppercased())")
        return .none
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completion event:", completion)
    }
}
