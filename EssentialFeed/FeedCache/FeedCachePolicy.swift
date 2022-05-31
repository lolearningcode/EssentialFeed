//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by Cleo Howard on 5/30/22.
//

import Foundation

final class FeedCachePolicy {
    private init() {}
    
    private static let calendar = Calendar(identifier: .gregorian)
    
    private static var maxCachedAge: Int {
        return 7
    }
    
    static func validate(_ timestamp: Date, against date: Date) -> Bool {
        guard let maxCachedAge = calendar.date(byAdding: .day, value: maxCachedAge, to: timestamp) else { return false }
        
        return date < maxCachedAge
    }
}
