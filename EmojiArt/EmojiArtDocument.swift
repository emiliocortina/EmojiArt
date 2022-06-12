//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by Cortina Labra, Emilio on 4/6/22.
//

import SwiftUI

class EmojiArtDocument: ObservableObject {
	@Published private(set) var emojiArt: EmojiArtModel
	
	init() {
		emojiArt = EmojiArtModel()
		emojiArt.addEmoji("👀", at: (-200, -100), size: 80)
		emojiArt.addEmoji("🛫", at: (50, 100), size: 40)
	}
	
	var emojis: [EmojiArtModel.Emoji] { emojiArt.emojis }
	var background: EmojiArtModel.Background { emojiArt.background }
	
	func setBackground(_ background: EmojiArtModel.Background) {
		emojiArt.background = background
	}
	
	func addEmoji(_ emoji: String, at location: (x: Int, y: Int), size: CGFloat) {
		emojiArt.addEmoji(emoji, at: (x: location.x, y: location.y), size: Int(size))
	}
	
	
}
