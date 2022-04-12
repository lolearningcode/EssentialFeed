//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Teddy Be Goin Hard on 4/11/22.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}
public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
