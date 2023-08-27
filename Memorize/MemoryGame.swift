//
//  MemoryGame.swift
//  Memorize
//
//  Created by Or Israeli on 26/08/2023.
//

import Foundation

struct MemoryGame<CardContent> {
	private(set) var cards: [Card]
	
	init(numberOfCardPairs: Int, cardContentFactory: (Int) -> CardContent) {
		cards = []
		
		//add numberOfCardPairs x 2 cards
		for pairIndex in 0 ..< max(2, numberOfCardPairs)  {
			let content = cardContentFactory(pairIndex)
			cards.append(Card(content: content))
			cards.append(Card(content: content))
		}
	}
	
	func choose(_ card: Card) {
		
	}
	
	mutating func shuffle() {
		cards.shuffle()
		print(cards)
	}
	
	struct Card {
		var isFaceUp = true
		var isMatched = false
		let content: CardContent
	}
}
