//
//  GameEngine.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class GameEngine {
  let player1 : Player
  let player2 : Player
  let deck : Deck
  var gameOver : Bool = false

  init(player1 : String, player2 : String) {
    self.deck = Deck()
    let player1Hand = Hand(cards: deck.split().0)
    let player2Hand = Hand(cards: deck.split().1)
    self.player1 = Player(name: player1, hand: player1Hand)
    self.player2 = Player(name: player2, hand: player2Hand)
  }


  func playOneTurn() -> (Player, Card?, Card?) {
    var winningPlayer : Player = Player(name: "", hand: player1.hand)
    var player1Card : Card?
    var player2Card : Card?

    if player1.hasCards() && player2 .hasCards() {
      player1Card = player1.flip()!
      player2Card = player2.flip()!
      if (player1Card?.rank.rawValue)! > (player2Card?.rank.rawValue)! {
        winningPlayer = player1
        player1.lose(card: player1Card!)
        player2.lose(card: player2Card!)
        award(cards: [player1Card!, player2Card!], to: player1)

      } else {
        winningPlayer = player2
        player1.lose(card: player1Card!)
        player2.lose(card: player2Card!)
        award(cards: [player1Card!, player2Card!], to: player2)
      }
    } else if !player1.hasCards() {
      winningPlayer = player2
      player1Card = nil
      player2Card = nil
      gameOver = true
    } else if !player2.hasCards() {
      winningPlayer = player1
      player1Card = nil
      player2Card = nil
      gameOver = true
    }
    return (winningPlayer, player1Card, player2Card)
  }


  func award(cards : [Card], to player : Player) {
    for card in cards {
      player.give(card: card)
    }
  }

//  func gameOver() -> Bool {
//    return !player1.hasCards() || !player2.hasCards()
//  }





    
}


