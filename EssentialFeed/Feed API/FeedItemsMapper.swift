//
//  FeedItemsMapper.swift
//  EssentialFeed
//
//  Created by Teddy Be Goin Hard on 4/11/22.
//

import Foundation

class FeedItemsMapper {
    private struct Root: Decodable {
        let items: [Item]
        
        var feedItems: [FeedItem] {
            return items.map{ $0.item }
        }
    }
    
    private struct Item: Decodable {
        let id: UUID
        let description: String?
        let location: String?
        let image: URL
        
        var item: FeedItem {
            return FeedItem(id: id, description: description, location: location, imageURL: image)
        }
    }
    
    static var Ok_200: Int { return 200 }
    
    static func map(_ data: Data, from response: HTTPURLResponse) -> RemoteFeedLoader.Result {
        guard response.statusCode == Ok_200,
              let root = try? JSONDecoder().decode(Root.self, from: data)else {
            return .failure(.invalidData)
        }
        
        return .success(root.feedItems)
    }
}
