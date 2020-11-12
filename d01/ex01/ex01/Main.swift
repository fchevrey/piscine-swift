//
//  main.swift
//  ex01
//
//  Created by Fabien CHEVREY on 12/11/2020.
//

import Foundation

print("Hello, World!")
var card:Card = Card(color:eColor.club, value:eValue.King)
var card2:Card = Card(color:eColor.diamond, value:eValue.Queen)
var card3:Card = Card(color:eColor.diamond, value:eValue.Queen)

if (card == card2){
    print(card.description + " equal " + card2.description)
}
if (card2 == card3){
    print(card2.description + " equal " + card3.description)
}
print(Card(color:.heart, value:.two).description)
print(Card(color:.club, value:.three).description)
print(Card(color:.diamond, value:.As).description)
print(Card(color:.spade, value:.Jack).description)
print(Card(color:.spade, value:.ten).description)



