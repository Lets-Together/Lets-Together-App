//
//  ExerciseScreenViewModel.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 26/10/21.
//

import Foundation

class ExerciseScreenViewModel {

    var exerciseCards: [Exercise] = []

    var exercisesName = ["Jumping Jack", "Squat", "Burpees", "Abdominal", "Skater jumps laterais"]
    var exercisesImage = ["cris", "cris", "cris", "cris", "cris"]
    var leaderboards = ["leaderboard.jumpingjack", "leaderboard.squat", "Burpees", "Abdominal", "Skater jumps laterais"]

    init() {
        self.populatesExercises()
    }

    func populatesExercises() {
        for index in exercisesName.indices {
            let emptyExercise = Exercise(name: exercisesName[index], image: exercisesImage[index], leaderboard: leaderboards[index])
            self.exerciseCards.append(emptyExercise)
        }
    }

}
