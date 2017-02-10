//
//  Card.swift
//  EnumsFun
//
//  Created by Michael Dippery on 8/2/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation

enum Suit: String {
  case Spades = "♠️", Diamonds = "♦️", Hearts = "♥️", Clubs = "♣️"

  static let suits : [Suit] = [.Spades, .Diamonds, .Hearts, .Clubs]


}

enum Rank: Int {

  case two = 2, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace

  static let ranks : [Rank] = [.two,.three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace]

  var stringValue : String {
    switch self {
    case .jack:
      return "J"
    case .queen:
      return "Q"
    case .king:
      return "K"
    case .ace:
      return "A"
    default:
      return "\(self.rawValue)"
    }
  }

 
}

class Card : Equatable {

  let suit : Suit
  let rank : Rank

  var description : String {
    return "\(rank.stringValue)\(suit.rawValue)"
  }

  init(rank : Rank, suit : Suit) {
    self.rank = rank
    self.suit = suit
  }

  static func ==(lhs: Card, rhs : Card) -> Bool {
    return lhs.description == rhs.description
  }
    

    
}
