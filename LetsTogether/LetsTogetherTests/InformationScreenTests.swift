//
//  InformationScreenTests.swift
//  LetsTogetherTests
//
//  Created by José Mateus Azevedo on 18/11/21.
//

import XCTest
@testable import LetsTogether

class InformationScreenTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_informationScreen_view() {
        let sut = InformationScreenViewController(exercise: Exercise(labelML: "squat"))

        let view = sut.view as? InformationScreenView

        XCTAssertNotNil(view)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
