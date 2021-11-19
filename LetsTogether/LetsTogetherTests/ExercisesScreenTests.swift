//
//  ExercisesScreenTests.swift
//  LetsTogetherTests
//
//  Created by José Mateus Azevedo on 19/11/21.
//

import XCTest
@testable import LetsTogether

class ExercisesScreenTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_exercises_view() {
        let sut = ExercisesViewController()

        let view = sut.view as? ExercisesView

        XCTAssertNotNil(view)
    }

    func test_exercisesCell_view() {
        let sut = ExercisesViewController()

        let view = sut.view as? ExercisesView

        let cell = view?.colletionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: IndexPath(index: 1)) as? ExerciseCell

        XCTAssertNotNil(cell)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
