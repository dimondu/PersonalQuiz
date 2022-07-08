//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 07.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultAnimalLabel: UILabel!
    @IBOutlet weak var descriptionAnimalLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        showResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

extension ResultViewController {
    private func showResult() {
        
        let animalsTypes = answers.map {$0.animal}
        var numbersOfAnswers: [Animal: Int] = [:]
        
        for animal in animalsTypes {
            numbersOfAnswers[animal] = (numbersOfAnswers[animal] ?? 0) + 1
        }
        
        let sortedNumbersOfAnswers = numbersOfAnswers.sorted { $0.value > $1.value }
        guard let frequentAnimal = sortedNumbersOfAnswers.first?.key else { return }
        
        updateUI(with: frequentAnimal)
    }
    
    private func updateUI(with animal: Animal?) {
        resultAnimalLabel.text = "Вы - \(animal?.rawValue ?? "💩")!"
        descriptionAnimalLabel.text = animal?.definition ?? "Тебе сегодня не везёт"
    }
    
}
