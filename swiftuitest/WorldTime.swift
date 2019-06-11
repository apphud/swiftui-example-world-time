//
//  WorldTime.swift
//  swiftuitest
//
//  Created by Renat on 06/06/2019.
//  Copyright © 2019 softeam. All rights reserved.
//

import UIKit

struct WorldTime: Codable {
    let currentDateTime : String
    let dayOfTheWeek : String
    
    func date() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm'Z'"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        if let aDate = formatter.date(from: currentDateTime) {
            return aDate
        } else {
            return Date()
        }
    }
}
