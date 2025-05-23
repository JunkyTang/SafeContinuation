import XCTest
import SafeContinuation

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    // 测试正常返回
    func testNormalReturn() async throws {
        weak var weakRef: AnyObject?
        let result = try await withTimeout(seconds: 3) { (continuation: SafeContinuation<String>) in
            weakRef = continuation as AnyObject
            await continuation.resume(returning: "Hello SafeContinuation")
        }
        XCTAssertEqual(result, "Hello SafeContinuation")
        
        try await Task.sleep(nanoseconds: 500_000_000)
        XCTAssertNil(weakRef, "❌ SafeContinuation was not released after resume.")
    }
    
    // 测试异常返回
    func testErrorReturn() async throws {
        weak var weakRef: AnyObject?
        do {
            _ = try await withTimeout(seconds: 3) { (continuation: SafeContinuation<Void>) in
                weakRef = continuation as AnyObject
                await continuation.resume(throwing: ContinuationError.some)
            }
        } catch {
            XCTAssertEqual(error as? ContinuationError, ContinuationError.some)
        }
        
        try await Task.sleep(nanoseconds: 500_000_000)
        XCTAssertNil(weakRef, "❌ SafeContinuation was not released after resume.")
    }
    
    // 测试超时返回
    func testTimeout() async throws {
        
        weak var weakRef: AnyObject?
        do {
            _ = try await withTimeout(seconds: 3) { (continuation: SafeContinuation<Void>) in
                // 不调用 resume，应该超时
                weakRef = continuation as AnyObject
            }
            XCTFail("Expected timeout, but got success.")
        } catch {
            XCTAssertEqual(error as? ContinuationError, ContinuationError.timeout)
        }
        
        try await Task.sleep(nanoseconds: 500_000_000)
        XCTAssertNil(weakRef, "❌ SafeContinuation was not released after resume.")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
