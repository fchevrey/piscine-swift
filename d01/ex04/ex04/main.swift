//
//  main.swift
//  ex02
//
//  Created by Fabien CHEVREY on 12/11/2020.
//

import Foundation

print ("entire deck : ")
var deck = Deck(shuffle:true)
print(deck.cards)
var card:Card? = deck.draw()
print("draw " + card!.description)
print("remaining cards : ")
print(deck.cards)
deck.fold(card:card!)
print("discard ")
print("deck discard list = ")
print(deck.discards)
print("remaining cards : ")
print(deck.cards)


