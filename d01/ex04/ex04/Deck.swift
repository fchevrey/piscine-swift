//
//  Deck.swift
//  ex02
//
//  Created by Fabien CHEVREY on 12/11/2020.
//

import Foundation

class Deck: NSObject
{
    static let allSpade:[Card] = eValue.allValues.map
    {
        (val) -> Card in
            return Card(color:.spade, value:val)
    }
    
    static let allDiamonds:[Card] = eValue.allValues.map
    {
        (val) -> Card in
            return Card(color:.diamond, value:val)
    }
    
    static let allClubs:[Card] = eValue.allValues.map
    {
        (val) -> Card in
            return Card(color:.club, value:val)
    }
    
    static let allHearts:[Card] = eValue.allValues.map
    {
        (val) -> Card in
            return Card(color:.heart, value:val)
    }
    
    static let allCards:[Card] = allSpade + allClubs + allDiamonds + allHearts
    
    var cards:[Card]
    var discards:[Card]
    var outs:[Card]
    
    init(shuffle:Bool)
    {
        cards = Deck.allCards
        discards = []
        outs = []
        if (shuffle)
        {
            cards.Shuffle()
        }
        super.init()
    }
    
    func draw() -> Card?
    {
        if (cards.count > 0)
        {
            let card = cards.first!
            cards.remove(at: 0)
            outs.append(card)
            return card
        }
        return nil
    }
    
    func fold(card:Card)
    {
        if let index = outs.firstIndex(of:card)
        {
            outs.remove(at: index)
            discards.append(card)
        }
    }
}


extension Array
{
    mutating func Shuffle()
    {
        let count:Int = self.count
        let last:Int = count - 1
        for i in 0..<last
        {
            let index:Int = Int.random(in: i..<count)
            let tmp = self[i]
            self[i] = self[index]
            self[index] = tmp
        }
    }
}

