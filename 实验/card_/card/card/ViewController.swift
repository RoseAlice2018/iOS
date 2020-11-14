//
//  ViewController.swift
//  card
//
//  Created by Apple48 on 2020/9/14.
//  Copyright © 2020 Apple48. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardcollect.count + 1) / 2)
    var flipCount = 0
    {
        didSet
        {
            flipcountlabel.text = "Flips Count : \(flipCount)"
        }
    }
    
  
    @IBOutlet weak var flipcountlabel: UILabel!
    @IBOutlet var cardcollect: [UIButton]!
    var emojiChoices=["❤️","🚫","⚠️","🔔","🎵","▶️"]
    @IBAction func touchCard(_ sender: UIButton)
    {
        flipCount += 1
        if let cardNumber = cardcollect.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewConstraints()
            
        }
        else
        {
            print("chosed card is not in cardButtons")
        }
       // flipcountlabel.text = "Flips Count:\(flipCount)"
    }
   
    func updateViewFromMode(){
        for index in cardcollect.indices{
            let button = cardcollect[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for:card),
                                for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                if card.isMatched{
                    button.setTitle("", for: .normal)
                }
            }
            else{
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.8480411363, green: 0.9113985114, blue: 1, alpha: 1): #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                
            }
        }
    }
    var emoji = [Int : String]()
    func emoji(for card : Card) ->
        String{
            if emoji[card.identifier] == nil
                && emojiChoices.count > 0 {
                let randomIndex =
                    Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] =
                    emojiChoices.remove(at: randomIndex )
            }
            
            return emoji[card.identifier] ?? "?"
    }

}

