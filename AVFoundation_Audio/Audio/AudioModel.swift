//
//  AudioModel.swift
//  AVFoundation_Audio
//
//  Created by TIS Developer on 04.02.2022.
//

import Foundation
struct Audio {
    let author: String
    let name: String
    let bundleName: String
    let format: String
}

struct AudioModel {
    static var audios: [Audio] = [
        Audio(author: "Queen", name: "The Show Must Go On", bundleName: "Queen", format: "mp3"),
        Audio(author: "Макс Корж", name: "Малиновый закат", bundleName: "Макс Корж - Малиновый закат", format: "mp3"),
        Audio(author: "Макс Корж", name: "Малый повзрослел", bundleName: "Макс Корж - Малый повзрослел", format: "mp3"),
        Audio(author: "Руки Вверх", name: "Когда мы были молодыми", bundleName: "Руки Вверх - Когда мы были молодыми", format: "mp3"),
        Audio(author: "NILETTO", name: "Любимка", bundleName: "NILETTO - Любимка", format: "mp3"),
    ]
}
