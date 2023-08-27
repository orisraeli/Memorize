//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Or Israeli on 19/08/2023.
//

import SwiftUI

@main
struct MemorizeApp: App {
	@StateObject var game = EmojiMemoryGame()
	
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
