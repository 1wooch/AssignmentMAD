//
//  AssignmentMADTests.swift
//  AssignmentMADTests
//
//  Created by Wonwoo Choi on 17/3/2023.
//

import XCTest
import SwiftUI

@testable import AssignmentMAD
//@testable import
final class AssignmentMADTests: XCTestCase {
    @State var model:DataModel=DataModel()

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
        /// model value testing.
        var testvalue2 = checkListDetailitem(name: "test", check: false)
        XCTAssertTrue(testvalue2.name=="test") // pas
        XCTAssertTrue(testvalue2.check==false)//pas

        testvalue2.check.toggle()
        XCTAssertTrue(testvalue2.check==true) //pas
    }
    
    func testArrayTypeCHECK() throws{
        /// model value testing.
        var testvalue2 = checkListDetailitem(name: "test", check: false)
        XCTAssert(testvalue2.check is Bool)
//        if testvalue2.check is Bool{
//            print("name is String")
//        }else{
//            print("name is not String")
//
//        }        
    }
    func testArrayTypeNAME() throws{
        /// model value testing.
        var testvalue2 = checkListDetailitem(name: "test", check: false)
        XCTAssert(testvalue2.name is String)

    }
    func testArrayTypeCKLNAME() throws{
        /// model value testing.
        var testvalue2 = checkList(listName: "sd", checkListDetail: [checkListDetailitem(name: "test", check: false)])
        XCTAssert(testvalue2.listName is String)
    }
    func testArrayTypeCKLArray() throws{
        var testvalue2 = checkList(listName: "sd", checkListDetail: [checkListDetailitem(name: "test", check: false)])
        //print(type(of: testvalue2.checkListDetail))
        XCTAssert(testvalue2.checkListDetail is Array<checkListDetailitem>)
    }

    }

