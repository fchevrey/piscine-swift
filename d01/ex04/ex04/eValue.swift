//
//  eValue.swift
//  ex00
//
//  Created by Fabien CHEVREY on 12/11/2020.
//

import Foundation

enum eValue :Int
{
    case two = 2
    case three, four, five, six, seven, height, nine, ten
    case Jack, Queen, King, As
    
    static let allValues = [As, King, Queen, Jack, ten, nine, height, seven, six, five, four, three, two]
    var strValue:String
    {
        if self.rawValue <= 10
        {
            return String(self.rawValue)
        }
        
        if (self == .Jack)
        {
            return "Jack"
        }
        if (self == .Queen)
        {
            return "Queen"
        }
        if (self == .King)
        {
            return "King"
        }
        if (self == .As)
        {
            return "As"
        }
        return ""
    }
}
