//
//  ViewController.swift
//  TicTacToe-Animation
//
//  Created by Alice’z Poy on 2023-01-18.
//

import UIKit

class ViewController: UIViewController {

    var count = 1
    var activePlayer = 1 //cross
    var gameState = [0,0,0,
                     0,0,0,
                     0,0,0]
    var gameIsActive = true
    let winingCombinations = [[0, 1, 2],
                              [3, 4, 5],
                              [6, 7, 8],
                              [0, 3, 6],
                              [1, 4, 7],
                              [2, 5, 8],
                              [0, 4, 8],
                              [2, 4, 6]]
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var btnPlayAgain: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        if gameState[sender.tag-1] == 0 && gameIsActive {
            gameState[sender.tag-1] = activePlayer
            
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "cross"), for: .normal)
                sender.imageView?.alpha = 0
                UIView.animate(withDuration: 2) {
                    sender.imageView?.alpha = 1
                }
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "nought"), for: .normal)
                sender.imageView?.alpha = 0
                UIView.animate(withDuration: 2) {
                    sender.imageView?.alpha = 1
                }
                activePlayer = 1
            }
        }
        
        for combination in winingCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
                
                if gameState[combination[0]] == 1 {
                    resultLabel.text = "Cross has won!"
                } else {
                    resultLabel.text = "Circle has won!"
                }
                
                if gameIsActive {
                    for i in gameState {
                        count *= i
                    }
                    
                    if count != 0 {
                        resultLabel.text = "It was a draw!"
                        resultLabel.isHidden = false
                        btnPlayAgain.isHidden = false
                        
                    }
                }
                
                resultLabel.isHidden = false
                btnPlayAgain.isHidden = false
                
                resultLabel.center = CGPoint(x: resultLabel.center.x - 500, y: resultLabel.center.y)
                btnPlayAgain.center = CGPoint(x: btnPlayAgain.center.x - 500, y: btnPlayAgain.center.y)

                UIView.animate(withDuration: 2) {
                    self.resultLabel.center = CGPoint(x: self.resultLabel.center.x + 500, y: self.resultLabel.center.y)
                    self.btnPlayAgain.center = CGPoint(x: self.btnPlayAgain.center.x + 500, y: self.btnPlayAgain.center.y)
                }
            }
        }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        gameState = [0,0,0,
                     0,0,0,
                     0,0,0]
        gameIsActive = true
        activePlayer = 1
        resultLabel.isHidden = true
        btnPlayAgain.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: .normal)
        }
    }
}

