//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Teddy Be Goin Hard on 4/11/22.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}

class FeedItemsMapper {
    private struct Root: Decodable {
        let items: [RemoteFeedItem]
    }
        
    static var Ok_200: Int { return 200 }
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        guard response.statusCode == Ok_200,
              let root = try? JSONDecoder().decode(Root.self, from: data)else {
            throw RemoteFeedLoader.Error.invalidData
        }
        
        return root.items
    }
}
