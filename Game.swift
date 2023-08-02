//
//  Game.swift
//  FindNumber
//
//  Created by Nikita Moussa on 27.10.22.
//

import Foundation

class Game{
    
    struct Item{
        var title: String
        var isFound: Bool = false
    }
    
    private let data = Array(1...99)
    
    var items: [Item] = []
    
    private var countItems: Int
    var nextItem:Item?
    
    init(countItems: Int) {
        self.countItems = countItems
        setupGame()
    }
    
    private func setupGame(){
        var digits = data.shuffled()
        
        while items.count < countItems{
            let item = Item(title: String(digits.removeFirst()))
            items.append(item)
        }
        nextItem = items.shuffled().first
    }
    
    func check(index:Int){
        if items[index].title == nextItem?.title{
            items[index].isFound = true
            nextItem = items.shuffled().first(where: {(item) -> Bool in item.isFound == false})
        }
    }
}

