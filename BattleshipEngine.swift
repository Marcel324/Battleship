//
//  MontyEngine.swift
//  Monty
//
//  Created by Jason Gresh on 9/13/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class BattleshipEngine {
    let spaces: Int
    let battleShips: Int
    
    init(numCards:Int, battleShips: Int){
        self.spaces = numCards
        self.battleShips = battleShips
        setupGrid()
    }
    
    
    
    private enum State{
        case Lasthit
        case miss
        case hittable
    }
    
    private var grid = [State]()
        func setupGrid(){
//Attempt at removing some of the .miss from the grid and replacing with .hittable at random spots.
        grid = Array(repeating: .miss, count: spaces)
        for _ in 1...battleShips {
            grid.remove(at: Int(arc4random_uniform(UInt32(spaces))))
            grid.insert(.hittable, at: Int(arc4random_uniform(UInt32(spaces))))
        }
//            grid[Int(arc4random_uniform(UInt32(spaces)))] = .Lasthit
//    }
    
    //Tried to come up with a function that checks the grid and stops when Lasthit is hit only after all the hittables. Couldn't come up with one.
    func checkGrid(_ shipIn: [grid]) -> Bool{
        Switch State {
            }
}
