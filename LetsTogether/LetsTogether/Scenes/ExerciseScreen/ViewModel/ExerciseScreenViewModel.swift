//
//  ExerciseScreenViewModel.swift
//  LetsTogether
//
//  Created by José Mateus Azevedo on 26/10/21.
//

import Foundation

class ExerciseScreenViewModel {

    var exerciseCards: [Exercise] = []

    var exercisesName = ["Jumping Jack", "Burpees", "Abdominal", "Agachamento", "Skater jumps laterais"]
    var exercisesImage = ["cris", "cris", "cris", "cris", "cris"]

    init() {
        self.populatesExercises()
    }

    func populatesExercises() {
        for index in exercisesName.indices {
            let emptyExercise = Exercise(name: exercisesName[index], image: exercisesImage[index], description: "dsfsdfsdf", videoSource: "dsfsdfsdf")
            self.exerciseCards.append(emptyExercise)
        }
    }

}
