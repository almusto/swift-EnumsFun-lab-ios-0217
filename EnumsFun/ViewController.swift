//
//  ViewController.swift
//  EnumsFun
//
//  Created by Jim Campagno on 7/20/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var opponentCardLabel: UILabel!
    @IBOutlet weak var playerCardLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var opponentScoreLabel: UILabel!
    @IBOutlet weak var flipCardButton: UIButton!



    let game = GameEngine(player1: "Sandro", player2: "Moe")

    @IBAction func flipCard(_ sender: UIButton) {

      print("button clicked")

      let (winner, player1Card, player2Card) = game.playOneTurn()

      playerCardLabel.text = player1Card?.description
      opponentCardLabel.text = player2Card?.description
      winnerLabel.text = "\(winner.name) wins!"

      playerScoreLabel.text = String(game.player1.hand.cards.count)
      opponentScoreLabel.text = String(game.player2.hand.cards.count)

      if game.gameOver {
        endGame()
      }
      
     
    }

  func endGame() {
    flipCardButton.isHidden = true
  }

    
   
    
}
