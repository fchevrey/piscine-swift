//
//  Card.swift
//  ex01
//
//  Created by Fabien CHEVREY on 12/11/2020.
//

import Foundation
class Card : NSObject
{
    var value:eValue
    var color:eColor
    override var description: String
    {
        return String(value.rawValue) + " of " + color//String(describing:color.rawValue)
    }
    
    init(color:eColor, value:eValue)
    {
        self.color = color
        self.value = value
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool
    {
        let other = object as? Card
        
        if (other == nil)
        {
            return false
        }
        return other!.value == self.value && other!.color == self.color
    }
    
    static func ==(left:Card, right:Card) -> Bool
    {
        return left.isEqual(right)
    }
    
}
