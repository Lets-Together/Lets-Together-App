//
//  ExerciseScreenViewModel.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 26/10/21.
//

import Foundation

class ExerciseScreenViewModel {

    var exerciseCards: [Exercise] = []

    let exercisesName = ["Jumping Jack", "Squat", "Jumping Jack - Time", "Squat- Time"]
    let exercisesImage = ["card1", "card2", "card1", "card2"]
    let labelML = ["jumping-jack", "squats", "jumping-jack", "squats"]
    let leaderboards = ["leaderboard.jumpingjack", "leaderboard.squat", "leaderboard.jumpingjack.time", "leaderboard.squat.time" ]
    let times = [nil, nil, 120, 120]
    init() {
        self.populatesExercises()
    }

    func populatesExercises() {
        for index in exercisesName.indices {
            let emptyExercise = Exercise(name: exercisesName[index], image: exercisesImage[index], leaderboard: leaderboards[index], time: times[index], labelML: labelML[index])
            self.exerciseCards.append(emptyExercise)
        }
    }

}
