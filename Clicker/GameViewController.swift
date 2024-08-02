//
//  GameViewController.swift
//  Clicker
//
//  Created by Кирилл Сысоев on 2.08.24.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var currentScoreLabel: UILabel!
    
    var currentScore : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttons = [redButton, greenButton, blueButton]
        
        for button in buttons {
            button?.addTarget(self, action: #selector(buttonTapped(_: )), for: .touchUpInside)
        }
        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        currentScore += 1
        updateLabel()
    }
    
    func updateLabel() {
        currentScoreLabel.text = "Текущий счет : \(currentScore)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameOverVC = segue.destination as? GameOverViewController {
            gameOverVC.currentGameScore = currentScore
        }
    }

}
