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
        
        if let mostChoseAnimal = getAnimal() {
            animalLabel.text = String(mostChoseAnimal.rawValue)
            definitionAnimalLabel.text = mostChoseAnimal.definition
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
        var animalCounts: [Animal: Int] = [:]
        
        for answerChoose in answersChosen {
            let animal = answerChoose.animal
            animalCounts[animal, default: 0] += 1
        }
        
        return animalCounts.max(by: { $0.value < $1.value })?.key
    }
}
