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
        let (_, store) = makeSUT()
        
        XCTAssertEqual(store.receivedMessages, [])
    }
    
    func test_load_requestsCacheRetrieval() {
        let (sut, store) = makeSUT()
        
        sut.load { _ in }
        
        XCTAssertEqual(store.receivedMessages, [.retrieve])
    }
    
    func test_load_failsOnRetrievalError() {
        let (sut, _) = makeSUT()
        let retrievalError = anyNSError()
        let exp = expectation(description: "Wait for load completion")
        
        var receivedError:Error?
        sut.load { error in
            receivedError = error
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 100.0)
        XCTAssertEqual(receivedError as NSError?, retrievalError)
    }
    
    // MARK: HELPERS
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #filePath, line: UInt = #line) -> (loader: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        trackForMemoryLeaks(sut, file: file, line: line)
        trackForMemoryLeaks(store, file: file, line: line)
        return (sut, store)
    }
    
    private func anyNSError() -> NSError {
        return NSError(domain: "any error", code: 0)
    }
}
