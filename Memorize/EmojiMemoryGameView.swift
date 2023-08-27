//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Or Israeli on 19/08/2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	@ObservedObject var viewModel: EmojiMemoryGame
	
	@State var themeColor = Color.orange
	@State var pairsCount = 10
	
	var body: some View {
		VStack {
			Text("Memorize!")
				.font(.largeTitle.bold())
			
			ScrollView {
				cards
					.foregroundColor(themeColor)
			}
			
			Spacer()
			
//			themeSwitchers
			
			Button("Shuffle") {
				viewModel.shuffle()
			}
		}
		.padding()
	}
	
	var cards: some View {
		LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
			ForEach(0..<viewModel.cards.count, id: \.self) { index in
				CardView(viewModel.cards[index])
					.aspectRatio(2/3, contentMode: .fit)
					.padding(4)
			}
		}
	}
	
//	var themeSwitchers: some View {
//		HStack(alignment: .lastTextBaseline, spacing: 25) {
//			themeSwitcher(ThemeManager.halloween, name: "Halloween",
//						  symbol: "moon.stars.fill", color: .orange)
//			themeSwitcher(ThemeManager.vehicles, name: "Vehicles",
//						  symbol: "car.fill", color: .red)
//			themeSwitcher(ThemeManager.animals, name: "Animals",
//						  symbol: "pawprint.fill", color: .green)
//		}
//		.tint(.primary)
//		.padding(.top)
//	}
//
//	func themeSwitcher(_ theme: [String], name: String, symbol: String, color: Color) -> some View {
//		Button {
//			var deck = theme
//			pairsCount = Int.random(in: 4...(deck.count / 2))
//			deck.removeLast(deck.count - (pairsCount * 2))
//
//			emojis = deck.shuffled()
//			themeColor = color
//		} label: {
//			VStack {
//				Image(systemName: symbol)
//					.imageScale(.large)
//				Text(name)
//					.font(.subheadline)
//			}
//		}
//	}
}

struct CardView: View {
	let card: MemoryGame<String>.Card
	
	init(_ card: MemoryGame<String>.Card) {
		self.card = card
	}
	
	var body: some View {
		ZStack {
			let base = RoundedRectangle(cornerRadius: 12)
			Group {
				base
					.fill(.white)
				base
					.strokeBorder(lineWidth: 2)
				Text(card.content)
					.font(.system(size: 200))
					.minimumScaleFactor(0.01)
					.aspectRatio(1, contentMode: .fit)
			}
			.opacity(card.isFaceUp ? 1 : 0)
			
			base
				.fill()
				.opacity(card.isFaceUp ? 0 : 1)
		}
	}
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
	static var previews: some View {
		EmojiMemoryGameView(viewModel: EmojiMemoryGame())
	}
}
