//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 20.12.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    // 1. Передать сюда массив с ответами
    var answersChoosen: [Answer] = []
    private var type = AnimalType.dog

    override func viewDidLoad() {
        super.viewDidLoad()
        // 2. Определить наиболее часто встречающийся тип животного
        getResult()
        // 3. Отобразить результат в соответсвии с этим живтным
        resultLabel.text = "ВЫ - \(type.rawValue)!"
        descriptionLabel.text = type.definition
        // 4. Избавится от кнопки возврата назад на экран результатов
        navigationItem.setHidesBackButton(true, animated: false)
    }
}

extension ResultsViewController {
    
    private func getResult() {
        let answers = answersChoosen
        guard let newType = answers.first?.type else {return}
        type = newType
        var mainCount = 1
        for i in 0 ..< answers.count {
            var count = 1
            for y in (i + 1) ..< answers.count {
                if answers[i].type == answers[y].type {
                    count += 1
                }
            }
            if count > mainCount {
                type = answers[i].type
                mainCount = count
            }
        }
    }
}
