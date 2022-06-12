//
//  EmojiArtModel.Background.swift
//  EmojiArt
//
//  Created by Cortina Labra, Emilio on 4/6/22.
//

import Foundation

extension EmojiArtModel {
	enum Background {
		case blank
		case url(URL)
		case imageData(Data)
		
		var url: URL? {
			switch self {
			case .url(let url): return url
			default: return nil
			}
		}
	}
}
