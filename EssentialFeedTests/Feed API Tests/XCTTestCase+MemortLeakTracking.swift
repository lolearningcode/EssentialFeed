//
//  XCTTestCase+MemortLeakTracking.swift
//  EssentialFeedTests
//
//  Created by Teddy Be Goin Hard on 4/14/22.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential Memory leak", file: file, line: line)
        }
    }
}
