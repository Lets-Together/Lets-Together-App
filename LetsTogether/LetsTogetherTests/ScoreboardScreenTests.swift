//
//  ScoreboardScreenTests.swift
//  LetsTogetherTests
//
//  Created by José Mateus Azevedo on 10/11/21.
//

import XCTest
@testable import LetsTogether

class ScoreboardScreenTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_scoreboard_view() {
        let sut = ScoreBoardScreenViewController(exercise: Exercise())

        let view = sut.view as? ScoreBoardScreen

        XCTAssertNotNil(view)
    }

    func test_scoreView_shows_correct_points() {
        // Given
        let workoutViewModal = WorkoutScreenViewModel(bodyPose: BodyPoseHelper(), bodyPontuation: BodyPontuationHelper(movementName: "jumping-jack", percetage: 0.8),
                                                      timer: TimeHelper(timeToFinish: nil), exercise: Exercise())
        workoutViewModal.addPoints(amount: 500)
        workoutViewModal.savePoints(points: Int16(workoutViewModal.score), leaderboard: "jumping-jack")
        let savedScores = workoutViewModal.score

        // When
        let scoreViewModal = ScoreBoardScreenViewModel()
        let currentScores = scoreViewModal.coreDataManager.getData()?.currentScores

        // Then
        XCTAssertEqual(Int16(savedScores), currentScores)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
