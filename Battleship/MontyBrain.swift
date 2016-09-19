//
//  MontyEngine.swift
//  Monty
//
//  Created by Jason Gresh on 9/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class MontyBrain {
    let numCards: Int
    let battleShips: Int
    
    init(numCards:Int, battleShips: Int){
        self.numCards = numCards
        self.battleShips = battleShips
        setupCards()
    }
    
    
    
    private enum State{
        case hit
        case hittable
        case miss
    }
    
    private var cards = [State]()
        func setupCards(){

        cards = Array(repeating: .miss, count: numCards)
        for _ in 1...battleShips {
            cards.remove(at: Int(arc4random_uniform(UInt32(numCards))))
            cards.append(.hittable)
        }

        cards[Int(arc4random_uniform(UInt32(numCards)))] = .hit
    }
    
    func checkCard(_ cardIn: Int) -> Bool{
        assert(cardIn < cards.count)  //helps with debugging
        return cards[cardIn] == .hit
    }
}
