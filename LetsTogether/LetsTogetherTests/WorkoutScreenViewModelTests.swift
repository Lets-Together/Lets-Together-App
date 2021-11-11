//
//  WorkoutScreenViewModelTests.swift
//  LetsTogetherTests
//
//  Created by Mateus Nobre on 30/09/21.
//

import XCTest
@testable import LetsTogether

class WorkoutScreenViewModelTests: XCTestCase {

    var viewModel = WorkoutScreenViewModel(bodyPose: BodyPoseHelper(), bodyPontuation: BodyPontuationHelper(movementName: "jumping-jack", percetage: 0.8),
                                           timer: TimeHelper(timeToFinish: 5), exercise: Exercise())

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_if_count_points_correctly() {
        //Given
        let workoutScreenViewModel = WorkoutScreenViewModel(bodyPose: BodyPoseHelper(), bodyPontuation: BodyPontuationHelper(movementName: "jumping-jack", percetage: 0.8),
                                                            timer: TimeHelper(timeToFinish: 5), exercise: Exercise())
        let addedPoints = 100
        //When
        workoutScreenViewModel.addPoints(amount: 100)
        //Then
        XCTAssertEqual(workoutScreenViewModel.score, addedPoints)
    }
    
    func test_if_pause_timer_is_pausing_timer() {
        //Given
        let workoutScreenViewModel = WorkoutScreenViewModel(bodyPose: BodyPoseHelper(), bodyPontuation: BodyPontuationHelper(movementName: "jumping-jack", percetage: 0.8),
                                                            timer: TimeHelper(timeToFinish: 5), exercise: Exercise())
        workoutScreenViewModel.startTimer(
            action: { _ in},
            didFinishedTimerAction: { }
        )
        XCTAssertTrue(workoutScreenViewModel.timerCounting)
        //When
        workoutScreenViewModel.pauseTimer()
        //Then
//        XCTAssertFalse(workoutScreenViewModel.timerHandler.timer.isValid)
        XCTAssertFalse(workoutScreenViewModel.timerCounting)
    }

    func test_if_start_timer_is_starting_timer() {
        //Given
        let workoutScreenViewModel = WorkoutScreenViewModel(bodyPose: BodyPoseHelper(), bodyPontuation: BodyPontuationHelper(movementName: "jumping-jack", percetage: 0.8),
                                                            timer: TimeHelper(timeToFinish: 5), exercise: Exercise())
        //When
        workoutScreenViewModel.startTimer(
            action: { _ in},
            didFinishedTimerAction: { }
        )
        //Then
        XCTAssertTrue(workoutScreenViewModel.timerCounting)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
