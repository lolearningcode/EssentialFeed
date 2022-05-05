//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Cleo Howard on 5/5/22.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
