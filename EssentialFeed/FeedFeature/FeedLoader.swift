//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Teddy Be Goin Hard on 4/6/22.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
