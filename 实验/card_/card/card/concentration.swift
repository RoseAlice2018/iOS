//
//  Concentration.swift
//  card
//
//  Created by wangty on 2020/9/20.
//  Copyright © 2020 Apple48. All rights reserved.
//

import Foundation
struct Card{
    var identifier : Int
    var isFaceUp = false
    var isMatched = false
    static var identifierFactory = 0
    static func getUniqueIdentifier()->Int{
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
class Concentration{
    var cards = [Card]()
    init(numberOfPairsOfCards : Int){
        
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        // shuffle the cards
        for _ in cards.indices{
            let index = Int(arc4random_uniform(UInt32(cards.count)))
            let card = cards.remove(at: index)
            cards.append(card)
        }
    }
    
    var indexOfOneAndOnlyFaceUpCard : Int?
    func chooseCard(at index : Int){
        if(!cards[index].isMatched){
            if let matchIndex = indexOfOneAndOnlyFaceUpCard,matchIndex != index{
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched =  true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                    
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    
}

