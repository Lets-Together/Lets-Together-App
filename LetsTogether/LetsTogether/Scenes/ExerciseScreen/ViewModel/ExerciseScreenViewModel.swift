//
//  ExerciseScreenViewModel.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 26/10/21.
//

import Foundation

class ExerciseScreenViewModel {

    var exerciseCards: [Exercise] = []

    var exercisesName = ["Jumping Jack", "Jumping Jack - Time", "Squat",  "Squat- Time"]
    var exercisesImage = ["cris", "cris", "cris", "cris"]
    var leaderboards = ["leaderboard.jumpingjack", "leaderboard.jumpingjack.time", "leaderboard.squat", "leaderboard.squat.time" ]
    var times = [nil, 120, nil, 120]
    init() {
        self.populatesExercises()
    }

    func populatesExercises() {
        for index in exercisesName.indices {
            let emptyExercise = Exercise(name: exercisesName[index], image: exercisesImage[index], leaderboard: leaderboards[index], time: times[index])
            self.exerciseCards.append(emptyExercise)
        }
    }

}
