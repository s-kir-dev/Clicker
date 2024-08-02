//
//  MenuViewController.swift
//  Clicker
//
//  Created by Кирилл Сысоев on 2.08.24.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var currentScoreLabel: UILabel!
    
    var currentScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backToMenu(_ segue : UIStoryboardSegue) {
        debugPrint("Вернулся в меню.")
        if let gameOverVC = segue.source as? GameOverViewController {
            currentScore = gameOverVC.currentGameScore
        } else if let gameVC = segue.source as? GameViewController {
            currentScore = gameVC.currentScore
        }
        updateLabel()
    }
    
    func updateLabel() {
        currentScoreLabel.text = "Счет предыдущей игры : \(currentScore)"
    }

}
