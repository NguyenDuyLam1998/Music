//
//  Music.swift
//  PlayMusic
//
//  Created by Lâm Nguyễn on 06/07/2021.
//  Copyright © 2021 Lâm Nguyễn. All rights reserved.
//

import Foundation
class Music {
    var nameSong: String?
    var song: String?
    var nameSinger: String?
    var imageSinger: String?
    init(nameSong: String, song: String, nameSinger: String, imageSinger: String) {
        self.nameSong = nameSong
        self.song = song
        self.nameSinger = nameSinger
        self.imageSinger = imageSinger
    }
}



