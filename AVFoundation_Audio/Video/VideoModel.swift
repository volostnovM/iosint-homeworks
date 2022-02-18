//
//  VideoModel.swift
//  AVFoundation_Audio
//
//  Created by TIS Developer on 18.02.2022.
//

import Foundation
struct Video {
    let name: String
    let urlString: String
}

struct VideoModel {
    static var videos: [Video] = [
        Video(name: "Семен Слепаков: Или нет... (Семён Слепаков, Джавид Курбанов)", urlString: "https://www.youtube.com/watch?v=qmX6Hmrwd0E"),
        Video(name: "Би-2 — Я никому не верю (2022)", urlString: "https://www.youtube.com/watch?v=tsbg0eiKU1I"),
        Video(name: "Shawn Mendes - It'll Be Okay", urlString: "https://www.youtube.com/watch?v=KrgJp7Z1Hv8"),
    ]
}
