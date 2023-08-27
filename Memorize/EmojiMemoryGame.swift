//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Or Israeli on 26/08/2023.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
	private static func createMemoryGame() -> MemoryGame<String> {
		return MemoryGame(numberOfCardPairs: 10) { pairIndex in
			if ThemeManager.halloween.indices.contains(pairIndex) {
				return ThemeManager.halloween[pairIndex]
			} else {
				return "X"
			}
		}
	}
	
	@Published private var model = createMemoryGame()
	
	var cards: [MemoryGame<String>.Card] {
		return model.cards
	}
	
	// MARK: - Intents
	
	func shuffle() {
		model.shuffle()
	}
	
	func choose(_ card: MemoryGame<String>.Card) {
		model.choose(card)
	}
	
	
}
