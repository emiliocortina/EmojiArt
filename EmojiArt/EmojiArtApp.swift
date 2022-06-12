//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Cortina Labra, Emilio on 4/6/22.
//

import SwiftUI

@main
struct EmojiArtApp: App {
	let document = EmojiArtDocument()

    var body: some Scene {
        WindowGroup {
			EmojiArtDocumentView(document: document)
        }
    }
}
