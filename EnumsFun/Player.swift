//
//  Player.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

class Player {
  let name : String
  var hand : Hand

  init(name : String, hand : Hand) {
    self.name = name
    self.hand = hand
  }

  func hasCards() -> Bool {
    return hand.size > 0
  }

  func flip() -> Card? {
    for card in hand.cards {
      print(card.description)
    }
    return hasCards() ? hand.cards.last : nil
  }

  func give(card : Card) {
    hand.cards.insert(card, at: 0)
  }

  func lose(card : Card) {
    let index = hand.cards.index(of: card)
    hand.cards.remove(at: index!)
  }
  
}

