//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Teddy Be Goin Hard on 4/6/22.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
