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
}
