//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Cleo Howard on 5/25/22.
//

import Foundation
import EssentialFeed

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}
