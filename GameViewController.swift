//
//  GameViewController.swift
//  FindNumber
//
//  Created by Nikita Moussa on 27.10.22.
//

//MVC

import UIKit


class GameViewController: UIViewController{
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var nextDigit: UILabel!
    
    lazy var game = Game(countItems: buttons.count)
    override func viewDidLoad(){
        super.viewDidLoad()
        setupScreen()
    }
    
    @IBAction func pressedButton(_ sender: UIButton){
        guard let buttonIndex = buttons.firstIndex(of: sender) else {return}
        game.check(index: buttonIndex)
        sender.isHidden = true
        print(sender.currentTitle)
        updateUi()
    }
    
    private func setupScreen(){
        
        for index in game.items.indices{
            buttons[index].setTitle(game.items[index].title, for: .normal)
            buttons[index].isHidden = false
        }
        
        nextDigit.text = game.nextItem?.title
    }
    
    private func updateUi(){
        for index in game.items.indices{
            buttons[index].isHidden = game.items[index].isFound
        }
        nextDigit.text = game.nextItem?.title
    }
    
}
