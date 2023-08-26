//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Or Israeli on 26/08/2023.
//

import Foundation

struct MemorizeGame<CardContent> {
	var cards: [Card]
	
	func choose(card: Card) {
		
	}
	
	struct Card {
		var isFaceUp: Bool
		var isMatched: Bool
		var content: CardContent
	}
}
