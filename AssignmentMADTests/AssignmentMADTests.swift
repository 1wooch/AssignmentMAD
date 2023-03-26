//
//  AssignmentMADTests.swift
//  AssignmentMADTests
//
//  Created by Wonwoo Choi on 17/3/2023.
//

import XCTest
@testable import AssignmentMAD

final class AssignmentMADTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testArrayValue() throws{
        //_XCTAssertionType(MileStone1View().GroceryList2,"Array")
        //XCTAssertEqual(MileStone1View().GroceryList2[0][0], "Milk") // why not working???

        //XCTAssertEqual(MileStone1View().GroceryList2[0][0], "Water") // why not working???

        //assert((MileStone1View().GroceryList2 as Any) is Int)
        //var item = GroceryList(name: "milk", check: true)
        //XCTAssertEqual(item.name, "milk")
        //XCTAssertEqual(groceryInfo[.name, "milk")

        //XCTAssertEqual(item.check, true)
    }

}
