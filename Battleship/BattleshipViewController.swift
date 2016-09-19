//
//  FirstViewController.swift
//  Battleship
//
//  Created by Jason Gresh on 9/16/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class BattleshipViewController: UIViewController {
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var buttonContainer: UIView!
    
    let howManySpaces: Int
    let howManyShips: Int
    let engine: BattleshipEngine
    var loaded: Bool
    let resetTitle = "Reset"
    
    required init?(coder aDecoder: NSCoder) {
        self.howManySpaces = 20
        self.loaded = false
        self.howManyShips = 5
        self.engine = BattleshipEngine(numCards: self.howManySpaces, battleShips: self.howManyShips)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLayoutSubviews() {
        if !loaded {
            setUpGameButtons(v: buttonContainer, totalButtons: self.howManySpaces, buttonsPerRow: 6)
            self.view.setNeedsDisplay()
        }
        loaded = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func resetButtonColors() {
        for v in buttonContainer.subviews {
            if let button = v as? UIButton {
                button.backgroundColor = UIColor.blue
                button.isEnabled = true
            }
        }
    }
    
    func handleReset() {
        resetButtonColors()
        engine.setupGrid()
    }
    
    func disableCardButtons() {
        for v in buttonContainer.subviews {
            if let button = v as? UIButton {
                button.isEnabled = false
            }
        }
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        handleReset()
    }
    
    func buttonTapped(_ sender: UIButton) {
        gameLabel.text = sender.currentTitle
        
        if engine.checkGrid(sender.tag - 1) {
            gameLabel.text = "Winner winner chicken dinner!"
            sender.backgroundColor = UIColor.green
            disableCardButtons()
            
        } else {
            gameLabel.text = "Nope! Guess again."
            sender.backgroundColor = UIColor.red
        }
    }
    func setUpResetButton() {
        let resetRect = CGRect(x: 10, y: 300, width: 60, height: 40)
        let resetButton = UIButton(frame: resetRect)
        resetButton.setTitle(resetTitle, for: UIControlState())
        resetButton.backgroundColor = UIColor.darkGray
        resetButton.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
        view.addSubview(resetButton)
    }
    
    func setUpGameLabel () {
        gameLabel.text = "Let's Play!"
    }

    func setUpGameButtons(v: UIView, totalButtons: Int, buttonsPerRow : Int) {
        for i in 1...howManySpaces {
            let y = ((i - 1) / buttonsPerRow)
            let x = ((i - 1) % buttonsPerRow)
            let side : CGFloat = v.bounds.size.width / CGFloat(buttonsPerRow)
            
            let rect = CGRect(origin: CGPoint(x: side * CGFloat(x), y: (CGFloat(y) * side)), size: CGSize(width: side, height: side))
            let button = UIButton(frame: rect)
            button.tag = i
            button.backgroundColor = UIColor.blue
            button.setTitle(String(i), for: UIControlState())
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            v.addSubview(button)
        }
        
        setUpGameLabel()
    }
}



