//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Teddy Be Goin Hard on 4/7/22.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL)
}

public final class RemoteFeedLoader {
    private let client: HTTPClient
    private let url: URL
    
    public init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    public func load() {
        //        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
        client.get(from: url)
    }
}

