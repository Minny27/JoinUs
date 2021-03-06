//
//  DateFormatter.swift
//  JoinUs
//
//  Created by SeungMin on 2021/11/05.
//

import Foundation

extension DateFormatter {
    func dateToString(date: Date, dateFormat: DateFormat) -> String {
        self.locale = Locale(identifier: "ko_KR")
        self.dateFormat = dateFormat.type
        
        return self.string(from: date)
    }
}
