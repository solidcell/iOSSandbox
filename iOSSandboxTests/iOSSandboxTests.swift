import XCTest
import RealmSwift
@testable import iOSSandbox

class iOSSandboxTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = NSUUID().uuidString
    }
    
    func testExample() {
        let foo = Foo()
        foo.perform()
        XCTAssertEqual(foo.timesReceivedDelegateCall, 1)
    }
    
}
