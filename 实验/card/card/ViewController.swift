//
//  ViewController.swift
//  card
//
//  Created by Apple48 on 2020/9/14.
//  Copyright © 2020 Apple48. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
  
    
    var flipCount = 0
    {
        didSet{
            flipcountlabel.text = "Flips Count:\(flipCount)"
        }
    }
    
    @IBOutlet weak var flipcountlabel: UILabel!
    @IBOutlet var cardcollect: [UILabel]!
    var emojiChoices=["ghost","lion","cat","pig","rabbit","dog"]
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount+=1
        //print("ghost")
        if let cardNumber = cardcollect.index(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        else{
            print("chosed card is not in cardButtons")
        }
        flipCard(withEmoji: "ghost", on: sender)
       // flipcountlabel.text = "Flips Count:\(flipCount)"
    }
    func flipCard(withEmoji emoji : String,on button :UIButton){
        if(button.currentTitle == emoji){
            button.setTitle("", for: .normal)
            button.backgroundColor = UIColor.orange
        }else{
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = UIColor.white
        }
    }
    @IBAction func touchcard2(_ sender: UIButton) {
        flipCount+=1
        flipCard(withEmoji: "ghost", on: sender)
    }
    
    @IBAction func touchcard3(_ sender: UIButton) {
        flipCount+=1
        flipCard(withEmoji: "lion", on: sender)
    }
    
    @IBAction func tcard4(_ sender: UIButton) {
        flipCount+=1
        flipCard(withEmoji: "lion", on: sender)
    }
    @IBAction func tc5(_ sender: UIButton) {
        flipCount+=1
        flipCard(withEmoji: "cat", on: sender)
    }
    
    @IBAction func tc6(_ sender: UIButton) {
        flipCount+=1
        flipCard(withEmoji: "cat", on: sender)
    }
    
    @IBAction func tc7(_ sender: UIButton) {
        flipCount+=1
        flipCard(withEmoji: "pig", on: sender)
    }
    @IBAction func tc8(_ sender: UIButton) {
        flipCount+=1
        flipCard(withEmoji: "pig", on: sender)
    }
    
    @IBAction func tc9(_ sender: UIButton) {
        flipCount+=1
        flipCard(withEmoji: "rabbit", on: sender)
    }
    
    @IBAction func tc10(_ sender: UIButton) {
        flipCount+=1
        flipCard(withEmoji: "rabbit", on: sender)
    }
    
    @IBAction func tc11(_ sender: UIButton) {
        flipCount+=1
        flipCard(withEmoji: "dog", on: sender)
    }
    
    @IBAction func tc12(_ sender: UIButton) {
        flipCount+=1
        flipCard(withEmoji: "dog", on: sender)
    }
    
}

