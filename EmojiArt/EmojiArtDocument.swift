//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by Cortina Labra, Emilio on 4/6/22.
//

import SwiftUI

class EmojiArtDocument: ObservableObject {
	@Published private(set) var emojiArt: EmojiArtModel {
		didSet {
			if emojiArt.background != oldValue.background {
				fetchBackgroundImageDataIfNecessary()
			}
		}
	}
	
	@Published var backgroundImage: UIImage?
	@Published var backgroundImageFetchStatus = BackgroundImageFetchStatus.idle
	
	enum BackgroundImageFetchStatus {
		case idle
		case fetching
	}
	
	private func fetchBackgroundImageDataIfNecessary() {
		backgroundImage = nil
		switch emojiArt.background {
		case .url(let url):
			// fetch url
			backgroundImageFetchStatus = .fetching
			DispatchQueue.global(qos: .userInitiated).async {
				let imageData = try? Data(contentsOf: url)
				// We must use main queue for changes on the UI
				DispatchQueue.main.async { [weak self] in
					// Check the user hasn't dropped another image while this one was downloading
					if self?.emojiArt.background == EmojiArtModel.Background.url(url) {
						self?.backgroundImageFetchStatus = .idle
						if imageData != nil {
							self?.backgroundImage = UIImage(data: imageData!)
						}
					}
				}
			}
		case .imageData(let data):
			backgroundImage = UIImage(data: data)
		case .blank:
			break
			
		}
	}
	
	init() {
		emojiArt = EmojiArtModel()
		emojiArt.addEmoji("👀", at: (-200, -100), size: 80)
		emojiArt.addEmoji("🛫", at: (50, 100), size: 40)
	}
	
	var emojis: [EmojiArtModel.Emoji] { emojiArt.emojis }
	var background: EmojiArtModel.Background { emojiArt.background }
	
	func setBackground(_ background: EmojiArtModel.Background) {
		emojiArt.background = background
		print("background set to \(background)")
	}
	
	func addEmoji(_ emoji: String, at location: (x: Int, y: Int), size: CGFloat) {
		emojiArt.addEmoji(emoji, at: (x: location.x, y: location.y), size: Int(size))
	}
	
	
}
