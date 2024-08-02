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
    @IBOutlet weak var timeLeftLabel: UILabel!
    
    var currentScore : Int = 0
    var seconds = 30
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttons = [redButton, greenButton, blueButton]
        
        for button in buttons {
            button?.addTarget(self, action: #selector(buttonTapped(_: )), for: .touchUpInside)
        }
        timeLeftLabel.text = "\(seconds)"
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        makeTimer()
        currentScore += 1
        updateCounterLabel()
    }
    
    @objc func timerFired() {
        if seconds > 0 {
            seconds -= 1
            updateTimeLeftLabel()
        } else {
            timer?.invalidate()
            performSegue(withIdentifier: "GameOver", sender: self)
        }
    }
    
    func makeTimer() {
        if let isTimer = timer {
            return
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
            debugPrint("Таймер запущен.")
        }
    }
    
    func updateCounterLabel() {
        currentScoreLabel.text = "Текущий счет : \(currentScore)"
    }
    
    func updateTimeLeftLabel() {
        timeLeftLabel.text = "\(seconds)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameOverVC = segue.destination as? GameOverViewController {
            gameOverVC.currentGameScore = currentScore
        }
    }

}
