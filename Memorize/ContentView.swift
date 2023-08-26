//
//  ContentView.swift
//  Memorize
//
//  Created by Or Israeli on 19/08/2023.
//

import SwiftUI

struct ContentView: View {
	@State var emojis: [String] = ThemeManager.halloween.shuffled()
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
			
			themeSwitchers
		}
		.padding()
	}
	
	var cards: some View {
		LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
			ForEach(0..<emojis.count, id: \.self) { index in
				CardView(content: emojis[index])
					.aspectRatio(2/3, contentMode: .fit)
			}
		}
	}
	
	var themeSwitchers: some View {
		HStack(alignment: .lastTextBaseline, spacing: 25) {
			themeSwitcher(ThemeManager.halloween, name: "Halloween",
						  symbol: "moon.stars.fill", color: .orange)
			themeSwitcher(ThemeManager.vehicles, name: "Vehicles",
						  symbol: "car.fill", color: .red)
			themeSwitcher(ThemeManager.animals, name: "Animals",
						  symbol: "pawprint.fill", color: .green)
		}
		.padding(.top)
	}
	
	func themeSwitcher(_ theme: [String], name: String, symbol: String, color: Color) -> some View {
		Button {
			var deck = theme
			pairsCount = Int.random(in: 1...(deck.count / 2))
			deck.removeLast(deck.count - (pairsCount * 2))
			
			emojis = deck.shuffled()
			themeColor = color
		} label: {
			VStack {
				Image(systemName: symbol)
					.imageScale(.large)
				Text(name)
					.font(.subheadline)
			}
		}
	}
}

struct CardView: View {
	let content: String
	
	@State var isFaceUp = false
	
	var body: some View {
		ZStack {
			let base = RoundedRectangle(cornerRadius: 12)
			Group {
				base
					.fill(.white)
				base
					.strokeBorder(lineWidth: 2)
				Text(content)
					.font(.largeTitle)
			}
			.opacity(isFaceUp ? 1 : 0)
			
			base
				.fill()
				.opacity(isFaceUp ? 0 : 1)
		}
		.onTapGesture {
			isFaceUp.toggle()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
