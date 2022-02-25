//
//  Timer.swift
//  Navigation
//
//  Created by TIS Developer on 25.02.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import Foundation
class Timer {
    let startTime:CFAbsoluteTime
    var endTime:CFAbsoluteTime?

    init() {
        startTime = CFAbsoluteTimeGetCurrent()
    }

    func stop() -> CFAbsoluteTime {
        endTime = CFAbsoluteTimeGetCurrent()
        return duration!
    }

    var duration: CFAbsoluteTime? {
        if let endTime = endTime {
            return endTime - startTime
        } else {
            return nil
        }
    }
}
