//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definitionAnimalLabel: UILabel!
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let mostChosenAnimal = getAnimal() {
            animalLabel.text = String(mostChosenAnimal.rawValue)
            definitionAnimalLabel.text = mostChosenAnimal.definition
        }
        
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
    private func getAnimal() -> Animal? {
        let animalCounts = answersChosen.reduce(into: [:]) { count, answer in
            count[answer.animal, default: 0] += 1
        }
        
        return animalCounts.max(by: { $0.value < $1.value })?.key
    }
}
