//
//  GameOverViewController.swift
//  Clicker
//
//  Created by Кирилл Сысоев on 2.08.24.
//

import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var currentGameScoreLabel: UILabel!
    
    var currentGameScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    func updateLabel() {
        currentGameScoreLabel.text = "Счет за игру : \(currentGameScore)"
    }

}
