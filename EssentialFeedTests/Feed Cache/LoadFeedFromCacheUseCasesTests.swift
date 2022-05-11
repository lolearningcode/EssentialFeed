//
//  LoadFeedFromCacheUseCasesTests.swift
//  EssentialFeedTests
//
//  Created by Cleo Howard on 5/11/22.
//

import XCTest
import EssentialFeed

class LoadFeedFromCacheUseCasesTests: XCTestCase {
    
    func test_init() {
        func test_init_doesNotMessageStoreUponCreation() {
            let (_, store) = makeSUT()
            
            XCTAssertEqual(store.receivedMessages, [])
        }
    }
    
    // MARK: HELPERS
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #filePath, line: UInt = #line) -> (loader: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(store, file: file, line: line)
        return (sut, store)
    }
}
