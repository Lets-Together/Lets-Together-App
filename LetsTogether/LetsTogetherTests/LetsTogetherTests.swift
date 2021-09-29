//
//  LetsTogetherTests.swift
//  LetsTogetherTests
//
//  Created by José Mateus Azevedo on 13/09/21.
//

import XCTest
@testable import LetsTogether

class LetsTogetherTests: XCTestCase {
    
    var timeHelper = TimeHelper()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_fire_timer() {
        timeHelper.secondsCounter = 10
        timeHelper.fireTimer()
        XCTAssertEqual(timeHelper.secondsCounter, 11)
    }
    
    func test_if_timer_starts_and_pause() {
        XCTAssertFalse(timeHelper.timer.isValid)
        timeHelper.startSecondsTimer {}
        XCTAssertTrue(timeHelper.timer.isValid)
        timeHelper.pauseTimer()
        XCTAssertFalse(timeHelper.timer.isValid)
    }
    
    func test_seconds_to_string_format_conversion() {
        timeHelper.secondsCounter = 0
        var timeString = timeHelper.stringTime()
        XCTAssertEqual(timeString, "00:00:00")
        timeHelper.secondsCounter = 1000
        timeString = timeHelper.stringTime()
        XCTAssertEqual(timeString, "00:16:40")
        timeHelper.secondsCounter = 200000
        timeString = timeHelper.stringTime()
        XCTAssertEqual(timeString, "55:33:20")
    }
    
    func test_seconds_to_hours_minutes_seconds_conversion() {
        timeHelper.secondsCounter = 0
        var timeDictionary = timeHelper.secondsToHourMinutesAndSeconds()
        XCTAssertEqual(timeDictionary["seconds"], 0)
        XCTAssertEqual(timeDictionary["minutes"], 0)
        XCTAssertEqual(timeDictionary["hours"], 0)
        timeHelper.secondsCounter = 1000
        timeDictionary = timeHelper.secondsToHourMinutesAndSeconds()
        XCTAssertEqual(timeDictionary["seconds"], 40)
        XCTAssertEqual(timeDictionary["minutes"], 16)
        XCTAssertEqual(timeDictionary["hours"], 0)
        timeHelper.secondsCounter = 200000
        timeDictionary = timeHelper.secondsToHourMinutesAndSeconds()
        XCTAssertEqual(timeDictionary["seconds"], 20)
        XCTAssertEqual(timeDictionary["minutes"], 33)
        XCTAssertEqual(timeDictionary["hours"], 55)
    }
    
    func test_hours_minutes_seconds_to_time_string_conversion() {
        var hour = 0
        var minutes = 10
        var seconds = 0
        var timeString = timeHelper.secondsToTimeString(hours: hour, minutes: minutes, seconds: seconds)
        XCTAssertEqual(timeString, "00:10:00")
        hour = 21
        minutes = 3
        seconds = 58
        timeString = timeHelper.secondsToTimeString(hours: hour, minutes: minutes, seconds: seconds)
        XCTAssertEqual(timeString, "21:03:58")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
